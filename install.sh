#/bin/bash

white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"

echo -e "$purple(*)$blue Acepte permisos de Storage para continuar"
termux-setup-storage
echo -e "$purple(*)$blue instalando dependencias en$red 5$blue segundos.."
sleep 1
echo -e "$purple(*)$red 4$blue segundos"
sleep 1
echo -e "$purple(*)$red 3$blue segundos"
sleep 1
echo -e "$purple(*)$red 2$blue segundos"
sleep 1
echo -e "$purple(*)$red 1$blue segundos"
mv bienvenida.mp3 /sdcard/
cat termux_banner.sh > /data/data/com.termux/files/usr/bin/tbanner
chmod 700 /data/data/com.termux/files/usr/bin/tbanner
apt-get update -y
echo " "
apt-get upgrade -y
echo " "
pkg install tsu -y
pkg install figlet -y
echo " "
pkg install toilet -y
echo " "
pkg install cowsay -y
echo " "
pkg install nano -y
echo " "
pkg install ruby -y
echo " "
gem install lolcat
echo " "
pkg install nano -y
echo ""
pkg install mpv -y
echo " "
clear
echo -e "$purple(*)$blue para ejecutar puede escribir$red tbanner$blue en su terminal.."
sleep 4
echo -e "$purple(*)$blue Lanzando programa en 5 segundos.."
sleep 5
chmod +x termux_banner.sh
bash termux_banner.sh
