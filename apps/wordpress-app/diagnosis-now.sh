#!/bin/bash
echo "=== DIAGNÓSTICO POST-CONFIGURACIÓN ==="

# 1. Estado de contenedores
echo "1. Contenedores corriendo:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep -E "wordpress|mariadb"

# 2. wp-config.php actual
echo -e "\n2. wp-config.php (primeras 10 líneas):"
docker exec wordpress-app head -15 /var/www/html/wp-config.php 2>/dev/null | grep -E "define|DB_"

# 3. Conexión BD
echo -e "\n3. Conexión a BD:"
docker exec wordpress-db mysql -u wordpress -pnebula_password -e "SHOW DATABASES;" 2>/dev/null && echo "✅ Conexión OK" || echo "❌ Conexión fallida"

# 4. Tablas en BD 'wordpress'
echo -e "\n4. Tablas en BD 'wordpress':"
docker exec wordpress-db mysql -u wordpress -pnebula_password wordpress -e "SHOW TABLES;" 2>/dev/null | head -5

# 5. Prueba interna de WordPress
echo -e "\n5. Prueba HTTP interna:"
docker exec wordpress-app curl -s -o /dev/null -w "%{http_code}" http://localhost 2>/dev/null || echo "Error"

# 6. Logs de error
echo -e "\n6. Últimos errores:"
docker exec wordpress-app tail -5 /var/log/apache2/error.log 2>/dev/null || echo "No hay logs"
