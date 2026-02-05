#!/bin/bash
# scripts/setup-fail2ban-nebula.sh
# NEBULA - Intrusion Prevention System (Fail2Ban) Configuration

echo "=== NEBULA FAIL2BAN CONFIGURATION ==="

# 1. Install Fail2Ban
echo "Installing Fail2Ban..."
sudo apt update && sudo apt install -y fail2ban

# 2. Configure SSH Jail
echo "Configuring SSH jail (Port 2222)..."
sudo bash -c 'cat << EOF > /etc/fail2ban/jail.local
[DEFAULT]
bantime = 600
findtime = 600
maxretry = 3
ignoreip = 127.0.0.1/8 ::1

[sshd]
enabled = true
port = 2222
filter = sshd
logpath = %(sshd_log)s
backend = %(sshd_backend)s
EOF'

# 3. Configure Nginx Jail
echo "Configuring Nginx jail..."
sudo bash -c 'cat << EOF > /etc/fail2ban/jail.d/nginx.local
[nginx-http-auth]
enabled = true
port = http,https
filter = nginx-http-auth
logpath = /var/log/nginx/error.log
maxretry = 3
bantime = 600
EOF'

# 4. Enable and Restart Service
echo "Enabling and restarting Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

echo "------------------------------------------------"
echo "✅ Fail2Ban configured and active."
echo "🛡️  SSH (2222) and Nginx are now protected."
echo "------------------------------------------------"

# 5. Verify status
sudo fail2ban-client status
