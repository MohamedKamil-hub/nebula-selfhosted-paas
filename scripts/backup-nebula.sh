#!/bin/bash
# Definir la ruta base del proyecto de forma absoluta
BASE_DIR="/home/nebula-mohamed-kamil/proyecto_intermodular/nebula-selfhosted-paas"
BACKUP_PATH="$BASE_DIR/backups/$(date +%Y%m%d_%H%M)"

# Crear carpeta de backup
mkdir -p "$BACKUP_PATH"

echo "--- Iniciando Backup de NEBULA ---"

# 1. Configuración del Sistema (UFW y SSH)
echo "[1/3] Respaldando configuraciones de red y acceso..."
sudo tar -czf "$BACKUP_PATH/system_config.tar.gz" /etc/ssh /etc/fail2ban /etc/ufw 2>/dev/null

# 2. Datos de Docker (NPM, Bases de datos, WordPress)
echo "[2/3] Comprimiendo volúmenes de Docker..."
tar -czf "$BACKUP_PATH/docker_data.tar.gz" -C "$BASE_DIR" data/

# 3. Ajustar permisos (para que tu usuario pueda gestionar el backup)
sudo chown -R $USER:$USER "$BACKUP_PATH"

# Opcional: Borrar backups con más de 7 días para ahorrar espacio
find "$BASE_DIR/backups/" -type d -mtime +7 -exec rm -rf {} \; 2>/dev/null

echo "--- Backup completado con éxito en $BACKUP_PATH ---"
