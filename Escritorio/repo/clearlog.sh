#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
current_date=$(date)
archivo="log.txt"

# Comprobar si el archivo existe

if [ -f "$archivo" ]; then
  rm "$archivo"

fi

# Crear el archivo nuevamente
echo "Creando el archivo $archivo..."
touch "$archivo"

echo "----------------------------------------------------------------------------------------------------" >> $archivo
echo "El log s'ha restablit correctament.($current_date)(CN=$cn)" >> $archivo
echo "----------------------------------------------------------------------------------------------------" >> $archivo



