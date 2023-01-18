#!/bin/sh
#Este script se deebe ejecutar en un cronjob, sirve para alertar por almacenamiento si supera el threshold de 90%
#Me lo pidieron en entrevista tecnica
#Deben cambiar el usuario root por su usuario
cd /tmp
df -h | sort -k 5 -r | tee fs.txt
find . -name "fs.txt" -type f -exec awk 'NR==1 || $5>=90' {} + >>output.txt
mail -s 'Alerta espacio en servidor Macross' root < output.txt
rm /tmp/fs.txt
rm /tmp/output.txt
