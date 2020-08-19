
 #!/bin/bash

a="Crear banner"
b="Salir"

si="Si instalar"
no="No Salir"

clear
printf "\e[1;35m



▄▄                                                         
 ██                                                         
 ██▄███▄    ▄█████▄  ██▄████▄  ██▄████▄   ▄████▄    ██▄████ 
 ██▀  ▀██   ▀ ▄▄▄██  ██▀   ██  ██▀   ██  ██▄▄▄▄██   ██▀     
 ██    ██  ▄██▀▀▀██  ██    ██  ██    ██  ██▀▀▀▀▀▀   ██      
 ███▄▄██▀  ██▄▄▄███  ██    ██  ██    ██  ▀██▄▄▄▄█   ██      
 ▀▀ ▀▀▀     ▀▀▀▀ ▀▀  ▀▀    ▀▀  ▀▀    ▀▀    ▀▀▀▀▀    ▀▀     
 
 \n"
 sleep 3
 printf "\e[1;35mScript creado por Facu Salgado\n"
 sleep 3
 printf "\e[1;33mRegalame una estrella en github\e[1;34m. \n"
 echo
 echo
 
 PS3="Selecciona una opcion: "
 
select opt in "$a" "$b";
do
case $opt in
$a)
printf "\e[1;35mIngrese el texto del Banner:\e[1;32m "
read texto
sleep 3
printf "\e[1;35mElegiste el texto:\e[1;32m $texto \n"
sleep 3
printf "\e[1;35mTe mostraremos el diseño de tu banner \n"
var=$(toilet -f mono12 -F metal $texto)
printf "
$var
\n"
sleep 2
echo
echo
printf "\e[1;35mDesea instalar este banner en su termux?\e[1;34m \n"
echo
echo
select confirmar in "$si" "$no";
do
case $confirmar in
$si)
printf "\e[1;32mha confirmado el banner, lo instalaremos en 5 segundos..\n"
sleep 5
rm /data/data/com.termux/files/usr/etc/bash.bashrc
echo "clear" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "PS1='\$'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "printf '\e[1;33m Banner por:\e[1;32m Facu Salgado\n' " >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "echo" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "echo" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "toilet -f mono12 -F metal $texto" >> /data/data/com.termux/files/usr/etc/bash.bashrc
printf "\e[1;33mBanner instalado abra una ventana en termux y verifique..\n"
sleep 3
exit
;;
$no)
printf "\e[1;31mHa denegado el banner, saliendo..\n"
exit
;;
*)
echo "$REPLY No es una opcion valida"
;;
esac
done
;;
$b)
printf "\e[1;35mScript creado por Facu Salgado\n"
printf "\e[1;35Gracias por usarlo.\n"
break
;;
*)
echo "$REPLY opcion no valida"
;;
esac
done
 
 
