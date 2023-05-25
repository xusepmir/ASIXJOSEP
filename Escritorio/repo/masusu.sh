#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)


archivo=log.txt
current_date=$(date)

user=$1
ou=$2
password=$3
uid=$4
gid=$5


touch $user.ldif

echo "dn: uid=$user,ou=$ou,dc=$dc1,dc=$dc2" >> $user.ldif
echo "objectClass: top" >> $user.ldif
echo "objectClass: inetOrgPerson" >> $user.ldif
echo "objectClass: posixAccount" >> $user.ldif
echo "objectClass: person" >> $user.ldif
echo "cn: $user" >> $user.ldif
echo "uid: $user" >> $user.ldif
echo "uidNumber: $uid" >> $user.ldif
echo "gidNumber: $gid" >> $user.ldif
echo "ou: $ou" >> $user.ldif
echo "homeDirectory: /home/$user" >> $user.ldif
echo "loginShell: /bin/bash " >> $user.ldif
echo "userPassword: $password ">> $user.ldif
echo "sn: $user" >> $user.ldif
echo "mail: $user@email.es" >> $user.ldif
echo "givenName: $user" >> $user.ldif



ldapadd -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" -f $user.ldif

if [ $? -eq 0 ]; then

echo "El user $user s'ha creat correctament"
echo "-----------------------------------------------------" >> $archivo
echo "El user $user s'ha creat correctament.($current_date)(CN=$dc1)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

echo "-----------------------------------------------------" >> $archivo
echo "User: $user" >> passwords.txt
echo "-----------------------------------------------------" >> $archivo


hash=$(echo -n "$password" | sha512sum | awk '{print $1}')

echo "-----------------------------------------------------" >> passwords.txt
echo "Constrasenya: $password" >> passwords.txt
echo "-----------------------------------------------------" >> passwords.txt




rm $user.ldif
exit 0

else 

echo "El user $user no s'ha creat correctament , degut a que ja existeix o s'ha produit algun error"
echo "-----------------------------------------------------" >> $archivo
echo "El user $user no s'ha creat correctament,degut a que ja existeix o s'ha produit algun error.($current_date)(CN=$dc1)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

rm $user.ldif
exit 0

fi
  

