<?php
// 1. FORZAR DETECCIÓN DE HTTPS Y PUERTO (DEBE IR ARRIBA DEL TODO)
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}
// Forzamos el puerto manual para que coincida con el de NEBULA
$_SERVER['SERVER_PORT'] = 10443;

// 2. FORZAR URLS (Añade estas líneas si no están o modifícalas)
define('WP_HOME', 'https://wordpress.nebula.test:10443');
define('WP_SITEURL', 'https://wordpress.nebula.test:10443');
define('FORCE_SSL_ADMIN', true);
define('RELOCATE', true); // Esta línea ayudará a reajustar las rutas internas

// ... resto del código (require_once ABSPATH . 'wp-settings.php'; etc)
remove_filter('template_redirect', 'redirect_canonical');
