#!/bin/bash
echo "=== VERIFICACIÓN EXTREMA ==="

# 1. ¿Qué está en la BD realmente?
echo "1. BD completa wp_options:"
docker exec wordpress-db mysql -u wordpress -pnebula_password wordpress -e "SELECT option_name, LEFT(option_value, 50) FROM wp_options WHERE option_value LIKE '%10443%' OR option_name LIKE '%redirect%';"

# 2. ¿Hay plugins de redirección?
echo -e "\n2. Plugins instalados:"
docker exec wordpress-db mysql -u wordpress -pnebula_password wordpress -e "SELECT option_value FROM wp_options WHERE option_name='active_plugins';" | php -r 'print_r(unserialize(stream_get_contents(STDIN)));' 2>/dev/null || echo "No se pueden leer plugins"

# 3. Prueba DIRECTA a WordPress (sin NPM)
echo -e "\n3. Prueba directa HTTP (sin SSL, sin proxy):"
docker exec wordpress-app curl -s -H "Host: wordpress.nebula.test" http://localhost | head -3

# 4. Headers COMPLETOS desde la VM
echo -e "\n4. Headers completos:"
curl -k -v --max-redirs 0 https://wordpress.nebula.test:10443/ 2>&1 | grep -E "> GET|< HTTP|< location" | head -10

# 5. Archivo .htaccess actual
echo -e "\n5. .htaccess:"
docker exec wordpress-app cat /var/www/html/.htaccess 2>/dev/null || echo "No existe .htaccess"
