#!/bin/bash

converte_imagem(){

cd ~/Downloads/imagens-livros

if [ ! -d png ] 
then 
	mkdir png
fi

for imagem in *.jpg
do
	imagem_sem_extensao=$(ls $imagem  | awk -F . '{ print $1}')
	convert $imagem_sem_extensao.jpg  png/$imagem_sem_extensao.png
done

}

converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then
	echo "Conversao Realizada com Sucesso!!!"
else
	echo "ATENCAO !!! HOUVE uma Falha no Processo ..."
fi
