#!/bin/bash

# Instalar dependencias necesarias
sudo apt install -y apt-transport-https software-properties-common wget

# Añadir la clave GPG de Grafana
wget -q -O - https://packages.grafana.com/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/grafana.gpg

# Añadir el repositorio oficial de Grafana
echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Actualizar repositorios e instalar Grafana
sudo apt update
sudo apt install -y grafana
