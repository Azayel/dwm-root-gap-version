#!/bin/bash

#Get Upgradable packages



list=$(pacman -Qu 2> /dev/null)

if ["$list" == ""]; then
  count = 0
else
  count ='echo "$list" | wv -l'
fi 
