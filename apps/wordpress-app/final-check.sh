#!/bin/bash
echo "=== CHECK 1: Headers de respuesta ==="
curl -k -I --max-redirs 0 https://wordpress.nebula.test:10443/ 2>&1 | grep -E "HTTP|Location|X-"

echo -e "\n=== CHECK 2: Prueba interna (sin proxy) ==="
docker exec wordpress-app timeout 5 curl -s -D - http://localhost:80 2>/dev/null | head -5

echo -e "\n=== CHECK 3: BD URLs ==="
docker exec wordpress-db mysql -u wordpress -pnebula_password wordpress -e "SELECT option_name, option_value FROM wp_options WHERE option_name IN ('home', 'siteurl', 'active_plugins');"

echo -e "\n=== CHECK 4: wp-config.php (últimas 10 líneas) ==="
tail -10 ~/proyecto_intermodular/nebula-selfhosted-paas/apps/wordpress-app/wp-config.php

echo -e "\n=== CHECK 5: Acceso HTTP (sin SSL) ==="
curl -s -I --max-redirs 0 -H "Host: wordpress.nebula.test" http://localhost:10080 2>&1 | grep -E "HTTP|Location"
