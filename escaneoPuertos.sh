#!/bin/bash
#Juan Camilo Amortegui Salazar

#Programa que escanea los puertos de un host dado usando (nping <ip> -p <puertos> -c1 --rate <#_peticiones/seg>)
#Tambien se puede usar el comando (nc -zvvvn <ip> <puertos>)

#Parametros de entrada
ip=$1
puertos=$2

#Vriables
rate=20
seg_parametro=${#puertos}

echo "Escaneando..."

function escanear_1000_puertos_comunes(){
    rate_all=$((rate * 30))
    puerto=$(cat /home/juan/Desktop/bashScripts/puerto)
    resultado=$(nping $ip -p $puerto -c1 --rate $rate_all)
    imprimir
}

function escanear_unicos_puertos(){
    resultado=$(nping $ip -p $puertos -c1 --rate $rate )
    imprimir
}

function imprimir(){
    echo "$resultado" | grep -i "completed" | awk -F " " '{print $5}' | awk -F ":" '{print "PUERTO: "$2"/TCP - ABIERTO"}'
    echo "$resultado" | grep -i "seconds" | awk -F " " '{print "Tiempo de escaneo: "$8" segundos"}'
}

if [ $seg_parametro = 0 ]; then 
    escanear_1000_puertos_comunes
else 
    escanear_unicos_puertos
fi