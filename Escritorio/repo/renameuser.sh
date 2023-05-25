#!/bin/bash

# Define el nombre del grupo
nombre=$1
nombre2=$2

# Crea el grupo en LDAP y asigna la shell predeterminada
ldaprenameuser $nombre $nombre2

# Verifica el valor de salida del comando ldapaddgroup
i=$?
if [ "$i" -eq 0 ]; then
  echo "L'usuari $nombre ha canviat de nom a $nombre2."
  else "El comandament no s'ha executat correctament"
fi

# Verifica que el grupo se haya creado correctamente


