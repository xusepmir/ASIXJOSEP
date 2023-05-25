#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)

archivo=log.txt
current_date=$(date)

group=$1
ou=$2

ldapsearch -x -H ldap://localhost -b "dc=$dc1,dc=$dc2" "(cn=$group)" | grep -q "^dn:"

if [ $? -eq 0 ]; then

  echo "El grupo $group esta disponible per a borrar."
  echo "-----------------------------------------------------" >> $archivo
  echo "El grup $group se ha borrat.($current_date)(CN=$dc1)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  ldapdelete -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" "cn=$group,ou=$ou,dc=$dc1,dc=$dc2" 

  echo "El grup $grupo s'ha esborrat correctament."

  exit 0

  else

  echo "El grup $group se ha pogut borrar ja siga perque no existeix o ja esta borrat"

  echo "-----------------------------------------------------" >> $archivo
  echo "El grup $group se ha pogut borrar ja siga perque no existeix o ja esta borrat.($current_date)(CN=$dc1)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo


  fi

