#!/bin/bash
# scripts/backup-nebula.sh - Sistema de Backup de NEBULA
BACKUP_PATH="./backups/$(date +%Y%m%d)"
mkdir -p $BACKUP_PATH

echo "Iniciando backup de configuraciones críticas..."
# Backup de Config (SSH, UFW, Fail2Ban)
sudo cp -r /etc/ssh $BACKUP_PATH/
sudo cp -r /etc/fail2ban $BACKUP_PATH/

# Backup de Datos de Docker (NPM y Certificados)
tar -czf $BACKUP_PATH/nebula_data.tar.gz ./data/

echo "Backup completado en $BACKUP_PATH"
