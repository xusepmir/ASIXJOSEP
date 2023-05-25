#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)

archivo=log.txt
current_date=$(date)

group=$1
group2=$2

ldapsearch -x -H ldap://localhost -b "dc=$dc1,dc=$dc2" "(cn=$group)" | grep -q "^dn:"

if [ $? -eq 0 ]; then

  echo "El grupo $group existeix per lo tant se li pot canviar el nom."
  echo "-----------------------------------------------------" >> $archivo
  echo "El grup $group ha canviat de nom a  ($current_date)(CN=$dc1)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  ldaprenamegroup $group $group2

  slapcat | grep $group2

  echo "El grup $group s'ha renombrat correctament a $group2."

 

  else

  echo "El grup $group no s'ha pogut renombrar degut a que no existeix o esta borrat."

  echo "-----------------------------------------------------" >> $archivo
  echo "El grup $group no s'ha pogut renombrar degut a que no existeix o esta borrat.($current_date)(CN=$dc1)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  fi

 exit 0
















nombre=$1
nombre2=$2


ldaprenamegroup  $nombre $nombre2

slapcat | grep $nombre2

i=$?

if [ "$i" -eq 0 ]; then
  echo "S'ha canviat de nom correctament."
  else "No S'ha canviat de nom correctament."
fi



