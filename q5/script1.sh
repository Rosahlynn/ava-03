#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Uso: $0 <senha>"
    exit 1
fi

se="$1"

if [[ "$se" =~ [A-Z] ]] && [[ "$se" =~ [a-z] ]] && [[ "$se" =~ [0-9] ]]; then
    echo "Senha válida: A senha atende a todos os critérios."
else
    echo "Senha inválida: A senha deve conter pelo menos uma letra maiúscula, uma letra minúscula e um número."
fi
