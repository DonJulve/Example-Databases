#!/bin/bash

echo "Inserta tu contraseña :"
read -r -s contra
dir=""

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterAerolinea.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterModelo.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterAvion.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterAeropuerto.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterVuelo.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterIncidencia.ctl

echo "$contra" | sqlldr2 $USER@barret.danae04.unizar.es control=${dir}meterDesvio.ctl