#!/bin/bash
#Juan Camilo Amortegui Salazar

#Programa que saca los nombres de usuario y el directorio home de cada uno dependiendo de si la sheel esta configurada en /bin/false
#En el if tambien sirve poner "$linea" | grep "/bin/false" > /dev/null
while read -r linea; do
    if echo "$linea" | grep -q "/bin/false"; then
        usuario=$(echo "$linea" | awk -F ":" '{print $1}')
        directorio=$(echo "$linea" | awk -F ":" '{print $6}')
        echo "Usuario: $usuario - Directorio: $directorio"
    fi
done </etc/passwd
