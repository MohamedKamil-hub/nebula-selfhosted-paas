#!/bin/bash
echo "=== DIAGNÓSTICO POST-CORRECCIÓN ==="

# 1. wp-config.php
echo "1. wp-config.php:"
docker exec wordpress-app ls -l /var/www/html/wp-config.php
echo "Líneas: $(docker exec wordpress-app wc -l /var/www/html/wp-config.php | awk '{print $1}')"

# 2. Sintaxis PHP
echo -e "\n2. Sintaxis PHP:"
docker exec wordpress-app php -l /var/www/html/wp-config.php 2>&1

# 3. Conexión BD desde PHP
echo -e "\n3. Conexión BD (PHP):"
docker exec wordpress-app php -r "
\$conn = @mysqli_connect('wordpress-db', 'wordpress', 'nebula_password', 'wordpress');
if (\$conn) { 
    echo '✅ Conectado a BD'; 
    mysqli_close(\$conn);
} else { 
    echo '❌ Error: ' . mysqli_connect_error(); 
}
"

# 4. Prueba WordPress
echo -e "\n4. Prueba interna WordPress:"
docker exec wordpress-app curl -s -o /dev/null -w "HTTP: %{http_code}\n" http://localhost 2>/dev/null || echo "Error"

# 5. Si hay error, mostrar más detalles
echo -e "\n5. Si error 500, contenido de error:"
docker exec wordpress-app curl -s http://localhost 2>&1 | head -30
