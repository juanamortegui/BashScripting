# BashScripting
Scripts en bash :
1. (escaneoPuertos2.sh): Script que escanea los puertos de un HOST, este recibe como parametros la ip o el dominio a escanear y los puestos que se van a revisar, si no se le indican que puertos revisar va a tomar los 1000 puertos mas comunes segun el recurso (https://github.com/danielmiessler/SecLists/blob/master/Discovery/Infrastructure/nmap-ports-top1000.txt) que se encuentra dentro del archivo (4172636869766F20646520313030302070756572746F73.txt) incluido en el repositorio y es DESCARGADO AUTOMATICAMENTE POR EL PROGRAMA.

Requisitos: Tener instaladas las herramientas wget, nping, find , cat, grep, awk, echo
    
2. (sacarUsuarios.sh): Script que muestra el nombre y la ruta de los usuarios que cuentan con la shelll en /bin/false dentro del archivo /etc/passwd
