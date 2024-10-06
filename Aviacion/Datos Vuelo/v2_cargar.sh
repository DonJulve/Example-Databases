#!/bin/bash

echo "Inserta tu contraseña :"
read -r -s contra

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterAerolinea.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterModelo.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterAvion.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterAeropuerto.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterVuelo.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterCancelado_v2.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterRetraso_v2.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=meterDesvio_v2.ctl