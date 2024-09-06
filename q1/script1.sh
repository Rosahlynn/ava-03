#!/bin/bash

if [ -z "$1" ]; then
    echo "Erro: Nenhum nome de usuário foi fornecido."
    echo "Uso: $0 <nome_de_usuario>"
    exit 1
fi

us="$1"

while true; do
    
    echo "Escolha uma das opções:"
    echo "1 --> Verificar se o usuário existe"
    echo "2 --> Verificar se o usuário está logado na máquina"
    echo "3 --> Listar os arquivos da pasta home do usuário"
    echo "4 --> Sair"

    
    read -p "Digite a opção desejada: " op

case $op in
        1)
            
            if id "$us" &>/dev/null; then
                echo "O usuário '$us' existe no sistema."
            else
                echo "O usuário '$us' não existe no sistema."
            fi
            ;;
        2)
           
            if who | grep -w "$us" &>/dev/null; then
                echo "O usuário '$us' está logado na máquina."
            else
                echo "O usuário '$us' não está logado."
            fi
            ;;
        3)
           
            home_dir=$(getent passwd "$us" | cut -d: -f6)
            if [ -d "$home_dir" ]; then
                echo "Arquivos da pasta home do usuário '$us':"
                ls "$home_dir"
            else
                echo "Erro: A pasta home do usuário '$us' não foi encontrada."
            fi
            ;;
        4)
            # Sair do script
            echo "Saindo..."
            break
            ;;
        *)
            # Caso a opção seja inválida
            echo "Opção inválida. Tente novamente."
            ;;
    esac
    echo ""
done
