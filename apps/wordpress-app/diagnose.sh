#!/bin/bash
echo "=== DIAGNÓSTICO COMPLETO WORDPRESS ==="

# 1. Estado de contenedores
echo "1. Contenedores:"
docker ps | grep -E "wordpress|mariadb"

# 2. wp-config.php
echo -e "\n2. wp-config.php (primeras 20 líneas):"
head -20 ~/proyecto_intermodular/nebula-selfhosted-paas/apps/wordpress-app/wp-config.php

# 3. BD URLs
echo -e "\n3. URLs en BD:"
docker exec wordpress-db mysql -u wordpress -pnebula_password wordpress -e "SELECT option_name, option_value FROM wp_options WHERE option_name IN ('home', 'siteurl');"

# 4. Prueba interna
echo -e "\n4. Prueba interna (contenedor -> contenedor):"
docker exec nebula-proxy curl -s -H "Host: wordpress.nebula.test" http://wordpress-app 2>/dev/null | head -3

# 5. Headers completos
echo -e "\n5. Headers de respuesta (desde VM):"
curl -k -I https://wordpress.nebula.test:10443 2>/dev/null | head -10

# 6. Logs de error recientes
echo -e "\n6. Últimos errores de WordPress:"
docker logs wordpress-app --tail 10 2>&1 | grep -i "error\|redirect\|301" | head -5
