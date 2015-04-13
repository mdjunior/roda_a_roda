#!/usr/bin/env bash
#
# Script que tenta adivinhar as palavras do Roda a roda ou do jogo da forca
#
# Autor: Manoel Domingues Junior mdjunior@ufrj.br
#
#

# Guardando string e arquivo
string=$1
file=$2

exec="cat $file | awk 'BEGIN{FS=OFS=\"\"}{ if ( "

# Obtendo tamanho da string
l=${#string} 
exec+="length(\$0) == $l "

i=0
while [ $i -lt ${#string} ];
do
    if [ ${string:$i:1} != "_" ]
    then
        exec+="&& \$$((i+1)) == \"${string:$i:1}\" ";

        # Colocando variavel para excluir letras mencionadas
        grep+=" grep -v ${string:$i:1} |";
    fi
    i=$((i+1));
done

exec+=") print \$0;}' ";

echo "Executando: $exec";
eval $exec;

exec+=" | grep -o '\S' | awk '{a[\$1]++}END{for(k in a)print a[k],k}' | sort -nr | $grep head -$l"
echo "Melhores opcoes de letras: $exec"
eval $exec;
