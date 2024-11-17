#!/bin/bash

# Definição de funções
preparar_ambiente() {
    echo "Preparando ambiente..."
    mkdir -p ~/meu_projeto
}

instalar_pacotes() {
    echo "Instalando pacotes necessários..."
    sudo apt install -y vim git
}

finalizar() {
    echo "Configuração concluída!"
}

# Função principal
main() {
    preparar_ambiente
    instalar_pacotes
    finalizar
}

# Chamando a função principal
main
