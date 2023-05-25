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

  echo "La ou $ou s'ha esborrat."
  echo "-----------------------------------------------------" >> $archivo
  echo "La ou $ou se ha borrat.($current_date)(CN=$cn)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  ldapdelete -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" "ou=$ou,dc=$dc1,dc=$dc2"

  

else

echo "La ou $ou no s'ha esborrat degut a que no existeix o ha escrit mal"

echo "-----------------------------------------------------" >> $archivo
echo "La ou $ou no s'ha esborrat degut a que no existeix o ha escrit mal.($current_date)(CN=$cn)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

exit 0

fi
