## $1="192.168.102.181" ## IP de prueba para remarcador 21
## $2="2" ## Numero de prueba para ID Conversor 2
## $3="1" ## Numero de prueba para Puerto del conversor en el que se encuentra conectado el remarcador.

TIMESTAMP="TIMESTAMP["$(date +"%Y-%m-%d %H:%M:%S")"]"
IP="IP[$1]"
EQUIPO="EQUIPO[$2]"
IDREM="IDREM[$3]"

HOST=$4

CONTENIDO=$(./modpoll -m enc -t4 -a $3 -r 49 -c 50 -1 -o 1 $1 -p 1024)

## Entrega salida stdout
curl -X POST -H "Content-Type: text/plain" -d "$TIMESTAMP$IP$EQUIPO$IDREM$CONTENIDO" $HOST