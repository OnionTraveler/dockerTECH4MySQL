#!/bin/bash

# docker network rm MySQL4onion
 [ `docker network ls | grep 'MySQL4onion' | cut -d ' ' -f 9` ] && echo "The network 「MySQL4onion」 has existed！" || docker network create -d bridge MySQL4onion


 [ `docker images | grep 'oniontraveler/mysql_container' | cut -d ' ' -f 1,5 --output-delimiter=':'` ] && echo "The image 「oniontraveler/mysql_container」 has existed！" || docker build -f ./myDockerfiles/onionfile -t oniontraveler/mysql_container:19.5.27 .

 [ `docker ps -a | grep 'mysqlerver' | rev | cut -d ' ' -f 1 | rev` ] && echo "The container 「mysqlerver」 has existed" || docker run -itd --name mysqlerver --hostname mysqlerver -p 3306:3306 --network=MySQL4onion oniontraveler/mysql_container:19.5.27


