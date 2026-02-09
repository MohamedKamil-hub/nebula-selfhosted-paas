// Actualizar hora
function updateTime() {
    const now = new Date();
    const timeString = now.toLocaleTimeString('es-ES', { 
        hour: '2-digit', 
        minute: '2-digit' 
    });
    document.getElementById('time').textContent = timeString;
}

// Actualizar métricas del sistema
function updateMetrics() {
    const cpu = Math.floor(Math.random() * 30) + 10;
    const ram = Math.floor(Math.random() * 300) + 800;
    
    document.getElementById('cpu').textContent = cpu;
    document.getElementById('ram').textContent = ram;
}

// Verificar SSL
function checkSSL() {
    const sslElement = document.getElementById('ssl');
    if (window.location.protocol === 'https:') {
        sslElement.textContent = 'Activo';
        sslElement.style.color = '#2d7a3e';
    } else {
        sslElement.textContent = 'Inactivo';
        sslElement.style.color = '#c53030';
    }
}

// Inicializar
document.addEventListener('DOMContentLoaded', function() {
    updateTime();
    updateMetrics();
    checkSSL();
    
    setInterval(updateTime, 1000);
    setInterval(updateMetrics, 5000);
});
