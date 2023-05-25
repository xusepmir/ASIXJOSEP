#!/bin/bash
current_date=$(date)

archivo="log.txt"

archivo2=config.txt

cn=$1
cd=$2
cd2=$3
cd3=$4



# Comprobar si el archivo existe

if [ -f "$archivo2" ]; then
  rm "$archivo2"

fi

# Crear el archivo nuevamente
echo "Creando el archivo $archivo2..."
touch "$archivo2"

echo "cn=$cn" >> config.txt
echo "dc1=$cd" >> config.txt
echo "dc2=$cd2" >> config.txt
echo "dc3=$cd3" >> config.txt




echo "----------------------------------------------------------------------------------------------------" >> $archivo
echo "S'han introduït valors d'administració.($current_date)("cn="$cn)" >> $archivo
echo "----------------------------------------------------------------------------------------------------" >> $archivo



