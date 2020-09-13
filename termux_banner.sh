#!/bin/bash

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


#directory verification
directory=$(pwd)


if which toilet >/dev/null; then
sleep 1
echo -e "$blue(Toilet)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(Toilet)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo pkg install toilet]"
sleep 1
exit 1
fi

if which cowsay >/dev/null; then
sleep 1
echo -e "$blue(cowsay)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(cowsay)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo pkg install cowsay]"
sleep 1
exit 1
fi

if which gem >/dev/null; then
sleep 1
echo -e "$blue(gem)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(gem)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo pkg install ruby -y]"
sleep 1
exit 1
fi

if which figlet >/dev/null; then
sleep 1
echo -e "$blue(figlet)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(figlet)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo pkg install figlet -y]"
sleep 1
exit 1
fi

if which mpv  >/dev/null; then
sleep 1
echo -e "$blue(mpv)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(mpv)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo pkg install mpv -y]"
sleep 1
exit 1
fi









export PS3=$'\e[01;35m(*)\e[01;32m Elige una Opcion:\e[01;33m '

#opciones menu

a="Perzonalizar Termux"
b="Creditos"
c="Restablecer por defecto"
update="Update Program"
d="Salir"

#syles banner

style1="Estilo 1"
style2="Estilo 2"
style3="Estilo 3"
style4="Estilo 4 figura ojos"
style5="Estilo 5 Figura vaca"

#ps1 modificar

a1="Si modificar"
a2="No"

#audio crear

a3="Si poner audio de bienvenida"
a4="no"

a5="Si"
a6="No"


clear
toilet -f big "Banner"  -F gay | lolcat
sleep 1
echo -e "$purple(*)$blue Created by$red Facundo Salgado"
sleep 2


function audioconfirm(){
echo
echo
select audio in "$a3" "$a4";
do
case $audio in 

$a3)
sed -i '1i clear' /data/data/com.termux/files/usr/etc/bash.bashrc
sed -i '2i mpv /sdcard/bienvenida.mp3' /data/data/com.termux/files/usr/etc/bash.bashrc
sleep 1
echo -e "$purple(*)$blue Audio seteado correctamente.."
sleep 2
echo -e "$purple(*)$blue volviendo al menu principal.."
menu_principal


;;

$a4)
echo -e "$purple(*)$blue Termux perzonalizado correctamente abra una ventana nueva y verifique$nc"
exit

;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done
}


function psconfirm(){
echo
echo
select confirmps in "$a5" "$a6";
do 
case $confirmps
in
$a5)
printf "\e[1;35mIngrese el texto del prefijo:\e[1;34m "
read prefix
sleep  2
echo -e "$purple(*)$blue el texto de su prefix es$red $prefix"
sleep 2
echo -e "$purple(*)$blue le mostraremos su prefijo a continuacion"
sleep 2
printf "\e[1;32mtermux@\e[1;33m$prefix\e[1;32m:# \033[1;92m"
sleep 2
echo "
PS1='\e[1;32mtermux@\e[1;33m$prefix\e[1;32m:# \033[1;92m'

" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue Prefix Seteado correctamente"
sleep 2
echo -e "$purple(*)$blue Desea agregar un audio de bienvenida al inicio?"
sleep 2
audioconfirm
;;

$a6)
echo "
PS1='\$ '
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue Desea agregar un audio de bienvenida al inicio?"
sleep 2
audioconfirm
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"

;;
esac
done


}






function bannerconfirm(){
echo
echo
select confirm in "$a5" "$a6";
do
case $confirm in 
$a5)
echo -e "$purple(*)$blue Bien crearemos este banner.."
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
toilet -f big '$bannertext'  -F gay | lolcat" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue desea cambiar el prefijo del texto de su terminal?"
sleep 2
psconfirm

;;

$a6)
echo -e "$purple(*)$blue OKey, volviendo al menu principal"
sleep 1
menu_principal
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done
}




function style_banner(){
echo
echo
select style in "$style1" "$style2" "$style3" "$style4" "$style5";
do
case $style in
$style1)
printf "\e[1;35mIngrese el texto del banner:\e[1;34m "
read bannertext
echo -e "$purple(*)$blue el texto de su banner es$red $bannertext"
sleep 2
echo -e "$purple(*)$blue LE mostraremos la vista previa de su banner"
sleep 2
toilet -f big "$bannertext"  -F gay | lolcat
sleep 2
echo -e "$purple(*)$blue Desea agregar el banner?"
sleep 1
bannerconfirm
;;

$style2)

printf "\e[1;35mIngrese el texto del banner:\e[1;34m "
read bannertext
echo -e "$purple(*)$blue el texto de su banner es$red $bannertext"
sleep 2
echo -e "$purple(*)$blue LE mostraremos la vista previa de su banner"
sleep 2
toilet -f big "$bannertext"  -F border | lolcat
sleep 2
echo -e "$purple(*)$blue Desea agregar el banner?"
sleep 1
select confirm in "$a5" "$a6";
do
case $confirm in 
$a5)
echo -e "$purple(*)$blue Bien crearemos este banner.."
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
toilet -f big '$bannertext'  -F border | lolcat
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue desea cambiar el prefijo del texto de su terminal?"
sleep 2
psconfirm

;;

$a6)
echo -e "$purple(*)$blue OKey, volviendo al menu principal"
sleep 1
menu_principal
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done


;;

$style3)

printf "\e[1;35mIngrese el texto del banner:\e[1;34m "
read bannertext
echo -e "$purple(*)$blue el texto de su banner es$red $bannertext"
sleep 2
echo -e "$purple(*)$blue LE mostraremos la vista previa de su banner"
sleep 2
toilet -f big $bannertext -F gay
sleep 2
echo -e "$purple(*)$blue Desea agregar el banner?"
sleep 1
select confirm in "$a5" "$a6";
do
case $confirm in 
$a5)
echo -e "$purple(*)$blue Bien crearemos este banner.."
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
toilet -f big '$bannertext' -F gay
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue desea cambiar el prefijo del texto de su terminal?"
sleep 2
psconfirm

;;

$a6)
echo -e "$purple(*)$blue OKey, volviendo al menu principal"
sleep 1
menu_principal
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done

;;


$style4)

printf "\e[1;35mIngrese su nombre:\e[1;34m "
read bannertext
echo -e "$purple(*)$blue el texto de su banner es$red $bannertext"
sleep 2
echo -e "$purple(*)$blue LE mostraremos la vista previa de su banner"
sleep 2
cowsay -f eyes  "Bienvenido a termux $bannertext" | lolcat
sleep 2
echo -e "$purple(*)$blue Desea agregar el banner?"
sleep 1
select confirm in "$a5" "$a6";
do
case $confirm in 
$a5)
echo -e "$purple(*)$blue Bien crearemos este banner.."
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
cowsay -f eyes  "Bienvenido a termux $bannertext" | lolcat
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue desea cambiar el prefijo del texto de su terminal?"
sleep 2
psconfirm

;;

$a6)
echo -e "$purple(*)$blue OKey, volviendo al menu principal"
sleep 1
menu_principal
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done

;; 

$style5)

printf "\e[1;35mIngrese su nombre:\e[1;34m "
read bannertext
echo -e "$purple(*)$blue el texto de su banner es$red $bannertext"
sleep 2
echo -e "$purple(*)$blue LE mostraremos la vista previa de su banner"
sleep 2
cowsay "Bienvenido a termux $bannertext" | lolcat
sleep 2
echo -e "$purple(*)$blue Desea agregar el banner?"
sleep 1
select confirm in "$a5" "$a6";
do
case $confirm in 
$a5)
echo -e "$purple(*)$blue Bien crearemos este banner.."
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
cowsay "Bienvenido a termux $bannertext" | lolcat
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "$purple(*)$blue desea cambiar el prefijo del texto de su terminal?"
sleep 2
psconfirm

;;

$a6)
echo -e "$purple(*)$blue OKey, volviendo al menu principal"
sleep 1
menu_principal
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done
;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done



}

function menu_principal() {
echo
echo
select menu in "$a" "$b" "$c" "$update" "$d";
do 
case $menu in
$a)
echo -e "$purple(*)$blue A continuacion eliga el estilo de su banner"
sleep 2
style_banner

;;

$b)
echo -e "$purple(*)$blue Programa creado por$red Facu Salgado"
sleep 2
echo -e "$purple(*)$blue mi github:$red github.com/bytesalgado"
sleep 2
echo -e "$purple(*)$blue mi instagram:$red @facukaku021"
sleep 2
menu_principal

;;

$c)

echo -e "$purple(*)$blue Restableciendo termux a valores por defecto"
sleep 2
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "
  
command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
PS1='\$ '
" >> /data/data/com.termux/files/usr/etc/bash.bashrc
sleep 1
echo -e "$purple(*)$blue Termux seteado al valor default.."
sleep 2
echo -e "$purple(*)$blue volviendo al menu principal.."
sleep 1
menu_principal
;;


$update)
if [ -e $directory/termux_banner.sh ]
then
rm $directory/termux_banner.sh
fi
echo -e "$purple(*)$blue Actualizando programa en 5 segundos.."
sleep 5
curl https://raw.githubusercontent.com/byteSalgado/termux-banner/master/termux_banner.sh > termux_banner.sh
chmod +x termux_banner.sh
echo -e "$nc($blue*$nc)$green Programa Actualizado.. vuelva a ejecutarlo nuevamente.."
sleep 3
exit

;;




$d)
echo -e "$purple(*)$blue Saliendo del programa.. Created by $red Facu Salgado$nc"
sleep 2
exit


;;

*)
echo -e "$purple(ERROR)$red $REPLY$blue OPCION NO VALIDA"
;;
esac
done
}
menu_principal
