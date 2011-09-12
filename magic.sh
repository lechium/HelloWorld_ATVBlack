#!/bin/bash

RSA_PUB=~/.ssh/id_rsa.pub

if [ -e $RSA_PUB ]; then

  RSA_CONTENTS=`cat $RSA_PUB`
  #echo $RSA_CONTENTS
  ssh root@apple-tv.local ""echo $RSA_CONTENTS" >> ~/.ssh/authorized_keys"

else
  
  echo "$RSA_PUB doesn't exist! run ssh-keygen and follow the directions!"

fi 

