#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Uso: $0 <arquivo>"
    exit 1
fi

a="$1"

if [ ! -f "$a" ]; then
    echo "Erro: O arquivo '$a' não existe."
    exit 1
fi


grep -Eo 'R\$[ ]?[0-9]{1,3}(\.[0-9]{3})*,[0-9]{2}' "$a"
