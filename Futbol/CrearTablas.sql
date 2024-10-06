CREATE TABLE Divisiones (
	den_oficial		VARCHAR(50)		CONSTRAINT PK_Div 	PRIMARY KEY
);

CREATE TABLE Temporadas (
    fecha_inicio    NUMBER(4) 		CONSTRAINT PK_Temp PRIMARY KEY,

    fecha_fin       NUMBER(4),

	CONSTRAINT CK_Temp CHECK (fecha_inicio = fecha_fin-1)
);

CREATE TABLE Jornadas (
	id_jor          VARCHAR(8)   CONSTRAINT PK_Jor    PRIMARY KEY,

	num_jor         NUMBER(2),	-- hasta 99 jornadas (42 max)
	mi_temp			NUMBER(4),
	mi_div			VARCHAR(50),

	CONSTRAINT FK_Temp_Div FOREIGN KEY (mi_div) REFERENCES Divisiones(den_oficial) ,
	CONSTRAINT FK_Jor_Temp FOREIGN KEY (mi_temp) REFERENCES Temporadas(fecha_inicio) 
);

CREATE TABLE Estadios (
	nom_est         VARCHAR(50)  CONSTRAINT PK_Est 	PRIMARY KEY,

	capacidad       NUMBER(6),
	fecha_inag	  	NUMBER(4),

	CONSTRAINT CK_Est CHECK (capacidad > 0)
);

CREATE TABLE Equipos (
	nom_corto       VARCHAR(50)	CONSTRAINT PK_Equ 	PRIMARY KEY,
	
	nom_oficial     VARCHAR(50),
	nom_his         VARCHAR(50),
	ciudad          VARCHAR(50),
	fecha_fund      NUMBER(4),
	mi_estadio      VARCHAR(50),

	CONSTRAINT FK_Equ_Est FOREIGN KEY (mi_estadio) REFERENCES Estadios(nom_est) 
);

CREATE TABLE Otros_nombres (
	otro_nombre			VARCHAR(50) CONSTRAINT PK_Otros_Nom PRIMARY KEY,
	
	nom_corto			VARCHAR(50) CONSTRAINT NN_nom_corto NOT NULL,

	CONSTRAINT FK_Otros_Nom_Equ FOREIGN KEY (nom_corto) REFERENCES Equipos(nom_corto) 
);

CREATE TABLE Partidos (
	id_par		  	VARCHAR(7)   CONSTRAINT PK_Par    PRIMARY KEY,

	goles_local	  	NUMBER(2) 	 CONSTRAINT NN_goles_local NOT NULL,
	goles_visit	  	NUMBER(2) 	 CONSTRAINT NN_goles_visit NOT NULL,
	mi_jor		 	VARCHAR(5)	 CONSTRAINT NN_mi_jor NOT NULL,
	equ_local  		VARCHAR(50),
	equ_visit  		VARCHAR(50),

	CONSTRAINT FK_Par_Jor FOREIGN KEY (mi_jor) REFERENCES Jornadas(id_jor),
	CONSTRAINT FK_Par_Equ_Local FOREIGN KEY (equ_local) REFERENCES Equipos(nom_corto),
	CONSTRAINT FK_Par_Equ_Visit FOREIGN KEY (equ_visit) REFERENCES Equipos(nom_corto),

	CONSTRAINT CK_Par CHECK ((equ_local <> equ_visit) AND (goles_local >= 0) AND (goles_visit >= 0))
);