#!/bin/bash
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)
dc3=$(grep '^dc3=' config.txt | cut -d '=' -f 2-)

password=$(sudo slappasswd)

archivo=log.txt
current_date=$(date)

user=$1
ou=$2
uid=$3
group=$4
email=$5
gid=$6

ldapsearch -x -LLL -D "cn=$cn,dc=$dc1,dc=$dc2" -W -b "dc=$dc1,dc=$dc2" "(uid=)"

if [ $? -eq 0 ]; then


  echo "El user $user ja existeix per lo tant no se creará"
  echo "-----------------------------------------------------" >> $archivo
  echo "El user $user no es crearà pel fet que ja existeix.($current_date)(CN=$dc1)" >> $archivo
  echo "-----------------------------------------------------" >> $archivo

  exit 0

else

  echo "Creant user $user"

fi

touch $user.ldif


echo "dn: uid=$user,ou=$ou,dc=$dc1,dc=$dc2" >> $user.ldif
echo "objectClass: top" >> $user.ldif
echo "objectClass: posixAccount" >> $user.ldif
echo "objectClass: inetOrgPerson" >> $user.ldif
echo "objectClass: person" >> $user.ldif
echo "cn: $user" >> $user.ldif
echo "uid: $user" >> $user.ldif
echo "ou: $group" >> $user.ldif
echo "uidNumber: $uid" >> $user.ldif
echo "gidNumber: $gid" >> $user.ldif
echo "homeDirectory: /home/$user" >> $user.ldif
echo "loginShell: /bin/bash " >> $user.ldif
echo "userPassword: {SSHA}$password ">> $user.ldif
echo "sn: $user" >> $user.ldif
echo "mail: $email" >> $user.ldif
echo "givenName: $user" >> $user.ldif

cat $user.ldif

ldapadd -x -D "cn=$cn,dc=$dc1,dc=$dc2" -w "$dc3" -f $user.ldif


slapcat | grep $user

echo "El user $user s'ha creat correctament"

echo "-----------------------------------------------------" >> $archivo
echo "El user $user s'ha creat correctament.($current_date)(CN=$dc1)" >> $archivo
echo "-----------------------------------------------------" >> $archivo

rm $user.ldif



