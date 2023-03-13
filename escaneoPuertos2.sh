#!/bin/bash
#Juan Camilo Amortegui Salazar

#Programa que escanea los puertos de un host dado usando (nping <ip> -p <puertos> -c1 --rate <#_peticiones/seg>)
#Tambien se puede usar el comando (nc -zvvvn <ip> <puertos>)

#Parametros de entrada
ip=$1
puertos=$2

#Constantes
rate=20
archivo=4172636869766F20646520313030302070756572746F73.txt

#Variables
seg_parametro=${#puertos}

echo "Escaneando..."

function escanear_1000_puertos_comunes(){
    echo "Se realizara el escaneo de los 1000 puertos mas comunes: "
    if [ ! -e $archivo ] ; then
        wget -q https://raw.githubusercontent.com/juanamortegui/BashScripting/main/4172636869766F20646520313030302070756572746F73.txt
    fi
    rate_all=$((rate * 30))
    ruta=$(find ./ -name "$archivo" 2>/dev/null)
    mil_puertos=$(cat $ruta)
    resultado=$(nping $ip -p $mil_puertos -c1 --rate $rate_all)
    imprimir
}

function escanear_unicos_puertos(){
    echo "Se realizara el escaneo de los puertos $puertos"
    resultado=$(nping $ip -p $puertos -c1 --rate $rate )
    imprimir
}

function imprimir(){
    echo "$resultado" | grep -i "completed" | awk -F " " '{print $5}' | awk -F ":" '{print "Puerto: "$2"/TCP - Abierto"}'
}
if (nping $ip | grep -q "No route to host") ;then
    echo "No se puede conectar al Host"
else
    if [ $seg_parametro = 0 ]; then 
        escanear_1000_puertos_comunes
    else 
        escanear_unicos_puertos
    fi
fi
