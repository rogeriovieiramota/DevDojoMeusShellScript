#!/bin/bash

if [ ! -d log ]
then
        mkdir log
fi

processos=$(ps -e -o pid --sort -size  | head -n 11 | grep [0-9])

for pid in $processos
do
        nome_processo=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S,) >> $nome_processo.log
        tamanho_process=$(ps -p $pid -o size | grep [0-9])
        echo "$(bc <<< "sacle=2;$tamanho_processo/1024") mb" >> log/$nome_processo.log
done

