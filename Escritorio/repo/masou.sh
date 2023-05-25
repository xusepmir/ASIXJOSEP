#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)

archivo=log.txt
current_date=$(date)
ou=$1



ldapsearch -x -H ldap://localhost -b "ou=$ou,dc=$dc1,dc=$dc2" "(objectClass=organizationalUnit)" dn

if [ $? -eq 0 ]; then


  echo "La ou $ou ja existeix per lo tant no se creará"
  echo "-----------------------------------------------------" >> $archivo
  echo "La ou $ou ja existeix per lo tant no se creará.($current_date)(CN=$cn)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  exit 0

else

echo "Creant la ou $ou."

touch $ou.ldif

echo "dn:ou=$ou,dc=$dc1,dc=$dc2" >> $ou.ldif
echo "objectClass:organizationalUnit" >> $ou.ldif
echo "ou:$ou" >> $ou.ldif

ldapadd -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" -f $ou.ldif


slapcat | grep $ou

echo "El ou $ou s'ha creat correctament"

echo "-----------------------------------------------------" >> $archivo
echo "La ou $ou s'ha creat correctament.($current_date)(CN=$cn)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

cat $ou.ldif

rm $ou.ldif

fi