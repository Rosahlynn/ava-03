#!/bin/bash

    echo "Uso: $0 [-c] <arquivo>"
    echo "  -c : Conta as linhas em branco do arquivo"
    echo "  Sem opção: Remove as linhas em branco do arquivo"

a="$2"

if [ -z "$a" ]; then
    a="$1"
fi

if [ ! -f "$a" ]; then
    echo "Erro: O arquivo '$a' não existe."
    exit 1
fi

if [ "$1" == "-c" ]; then

    echo "Contando as linhas em branco no arquivo '$a':"
    grep -c '^$' "$a"
else
    echo "Removendo as linhas em branco do arquivo '$a':"
    grep -v '^$' "$a"
fi

