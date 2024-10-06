
-- fecha de vuelo no puede ser antes de fabricacion del avion

-- vuelo no se desvia a aeropuerto destino

-- vuelo cancelado no puede ser desviado ni retrasado
CREATE TRIGGER cancelado_no_desviado_retrasado
BEFORE INSERT OR UPDATE ON DESVIO
FOR EACH ROW
DECLARE
  v_cancelado NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_cancelado
  FROM CANCELADO
  WHERE ID_VUELO = :NEW.ID_VUELO;

  IF v_cancelado > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede desviar un vuelo cancelado');
  END IF;
END;

CREATE TRIGGER cancelado_no_desviado_retrasado
BEFORE INSERT OR UPDATE ON RETRASO
FOR EACH ROW
DECLARE
  v_cancelado NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_cancelado
  FROM CANCELADO
  WHERE ID_VUELO = :NEW.ID_VUELO;

  IF v_cancelado > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede retrasar un vuelo cancelado');
  END IF;
END;

-- aerolinea o modelo huerfanos
CREATE TRIGGER avion_after_delete
AFTER DELETE ON AVION
FOR EACH ROW
BEGIN
  -- Verificar si la aerolínea o el modelo de este avión ya no se utilizan en otros aviones
  DECLARE carrier_count NUMBER;
  DECLARE model_count NUMBER;
  SELECT COUNT(*) INTO carrier_count FROM AVION WHERE AEROLINEA = OLD.AEROLINEA;
  SELECT COUNT(*) INTO model_count FROM AVION WHERE MODELO = OLD.MODELO;

  -- Si no se utilizan en otros aviones, eliminar de las tablas correspondientes
  IF carrier_count = 0 THEN
    DELETE FROM AEROLINEA WHERE CARRIER_CODE = OLD.AEROLINEA;
  END IF;

  IF model_count = 0 THEN
    DELETE FROM MODELO WHERE NOM_MODELO = OLD.MODELO;
  END IF;
END;