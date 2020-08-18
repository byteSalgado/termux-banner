#!/bin/bash
clear
printf "\e[1;34minstalaremos las depencias para ejecutar el script\n"
sleep 3
pkg update -y && pkg upgrade -y
pkg install toilet
clear
printf "\e[1;34mScript listo para funcionar, lo ejecutaremos en 5 segundos..\n"
chmod +x banner.sh
sleep 5
clear
bash banner.sh
