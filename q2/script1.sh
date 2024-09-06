#!/bin/bash

mostrar_uso() {
    echo "Uso: $0 [-a | -b | -c] <diretorio>"
    echo "  -a : Listar apenas os diretórios"
    echo "  -b : Listar apenas os executáveis"
    echo "  -c : Listar apenas os scripts shell"
    exit 1
}

op="$1"
d="$2"

# Verifica se o diretório existe
if [ ! -d "$d" ]; then
    echo "Erro: O diretório '$d' não existe."
    exit 1
fi

# Lista de acordo com a opção escolhida
case $op in
    -a)        
        echo "Listando apenas diretórios em '$d':"
        find "$d" -type d
        ;;
    -b)
        echo "Listando apenas executáveis em '$d':"
        find "$d" -type f -executable
        ;;
    -c)
        echo "Listando apenas scripts shell em '$d':"
        find "$d" -type f -name "*.sh"
        ;;
     *)
        mostrar_uso
        ;;
esac


mostrar_uso
