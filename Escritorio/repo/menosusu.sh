#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)


archivo=log.txt
current_date=$(date)

user=$1
ou=$2

ldapdelete -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" "uid=$user,ou=$ou,dc=$dc1,dc=$dc2"

if [ $? -eq 0 ]; then

echo "El user $user s'ha borrat correctament"
echo "-----------------------------------------------------" >> $archivo
echo "El user $user s'ha borrat correctament.($current_date)(CN=$dc1)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

echo "-----------------------------------------------------" >> $archivo
echo "User: $user" >> passwords.txt
echo "-----------------------------------------------------" >> $archivo

exit 0

else 

echo "El user $user no s'ha borrat correctament , degut a que ja esta borrat o s'ha produit algun error"
echo "-----------------------------------------------------" >> $archivo
echo "El user $user no s'ha borrat correctament , degut a que ja esta borrat o s'ha produit algun error.($current_date)(CN=$dc1)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

exit 0

fi
  

