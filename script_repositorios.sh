#!/bin/sh

#Script que introduciendo un repositorio como argumento devuelve los paquetes que han se han descargado de dicho repositorio o sus dependencias.

echo "Buscando paquetes:"

#Recorre la lista de paquetes
for i in `dpkg -l | grep '^ii' | cut -d " " -f 3`
do
	#Repositorios necesarios para cada paquete
	repositorios=$(apt-cache policy $i | sed -n /*/,/100/p | egrep "http*" | awk '{print $2}')

	#Recorre la lista de repositorios de un paquete concreto ($i)
	for x in $repositorios
	do	

		if [ $1 = $x ]
		then
			echo "$i"
		fi

	done
done



