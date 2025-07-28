#!/bin/bash

echo "🚀 Iniciando instalação dos requisitos para o SOC Autônomo..."

# Atualiza pacotes
echo "🔄 Atualizando pacotes..."
sudo apt update -y && sudo apt upgrade -y

# Instala Docker
echo "🐳 Instalando Docker..."
sudo apt install -y docker.io

# Ativa e inicia o serviço Docker
sudo systemctl enable docker
sudo systemctl start docker

# Instala Docker Compose
echo "📦 Instalando Docker Compose..."
sudo apt install -y docker-compose

# Instala Make
echo "🛠 Instalando Make..."
sudo apt install -y make

echo "👉 Agora você pode rodar: make up"
