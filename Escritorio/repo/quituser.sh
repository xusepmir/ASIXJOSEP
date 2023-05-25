#!/bin/bash

# Define el nombre del grupo
nombre=$1
grup=$2

# Crea el grupo en LDAP y asigna la shell predeterminada
ldapdeleteuserfromgroup $nombre $grup

# Verifica el valor de salida del comando ldapaddgroup
i=$?
if [ "$i" -eq 0 ]; then
  echo "L'usuari $nombre s'ha anyadit al grup $grup."
  else "El comandament no s'ha executat correctament"
fi

# Verifica que el grupo se haya creado correctamente


