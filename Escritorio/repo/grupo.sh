#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)

archivo=log.txt
current_date=$(date)

group=$1
guid=$3
ou=$2

ldapsearch -x -H ldap://localhost -b "dc=$dc1,dc=$dc2" "(cn=$group)" | grep -q "^dn:"

if [ $? -eq 0 ]; then


  echo "El grupo $group ja existeix per lo tant no se creará"
  echo "-----------------------------------------------------" >> $archivo
  echo "El grup $group no es crearà pel fet que ja existeix.($current_date)(CN=$cn)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  exit 0

else

  echo "Creant grup $group"

fi

touch $group.ldif

echo "dn: cn=$group,ou=$ou,dc=$dc1,dc=$dc2" >> $group.ldif
echo "objectClass: top" >> $group.ldif
echo "objectClass: posixGroup" >> $group.ldif
echo "gidNumber: $guid" >> $group.ldif
echo "cn: $group" >> $group.ldif

ldapadd -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" -f $group.ldif


slapcat | grep $group

echo "El grup $group s'ha creat correctament"

echo "-----------------------------------------------------" >> $archivo
echo "El grup $group s'ha creat correctament.($current_date)(CN=$cn)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

cat $group.ldif

rm $group.ldif