# NEBULA 🌌

**Self-hosted platform for deploying web applications on modest hardware**

[![Status](https://img.shields.io/badge/Status-In_Development-yellow)](https://github.com/MohamedKamil-hub/nebula-selfhosted-paas)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> A lightweight alternative to Heroku, Render, or Vercel — built for small teams, developers, and homelabs who want **full control** without recurring SaaS costs.

---

## 🎯 What is NEBULA?

NEBULA is a self-managed server platform that lets you deploy and manage web applications using Docker containers on hardware as modest as **2 vCPU / 4 GB RAM**. It integrates:

- 🔐 **Automatic SSL** certificates via Let's Encrypt
- 📊 **Real-time monitoring** with Netdata (consuming ~100-200 MB RAM)
- 🛡️ **Security hardening** with UFW firewall, Fail2Ban, and SSH key-only access
- 🐳 **Docker-based deployments** for portability and isolation

Perfect for startups, homelab enthusiasts, or anyone tired of vendor lock-in.

---

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| **Zero SaaS Costs** | Host on your own VPS or hardware — pay only for the server |
| **Data Sovereignty** | Your data stays under your control, always |
| **Lightweight Monitoring** | Netdata uses up to 88% less RAM than Prometheus in low-scale setups |
| **Automated SSL** | Let's Encrypt certificates renew automatically via Nginx Proxy Manager |
| **Battle-Tested Security** | SSH hardening, firewall rules, and intrusion prevention out of the box |

---

## 🏗️ Architecture

```
Internet → UFW Firewall → Nginx Proxy Manager (SSL) → Docker Containers
                                                         ├─ App 1
                                                         ├─ App 2
                                                         └─ Netdata (Monitoring)
```

**Tech Stack:**
- **OS:** Ubuntu 24.04 LTS (kernel 6.8.0-90 recommended for stability)
- **Containerization:** Docker Engine + Docker Compose v2
- **Reverse Proxy:** Nginx Proxy Manager
- **Monitoring:** Netdata Agent
- **Security:** UFW, Fail2Ban, SSH with public key authentication

---

## 🚀 Quick Start

### Prerequisites
- Ubuntu 24.04 LTS server (VPS or local)
- Root/sudo access
- Domain name (optional, can use IP or DuckDNS)

### Installation

```bash
# Clone the repository
git clone https://github.com/MohamedKamil-hub/nebula-selfhosted-paas.git
cd nebula-selfhosted-paas

# Copy environment template
cp .env.example .env

# Edit with your configuration
nano .env

# Run the complete setup script
sudo ./scripts/setup_nebula_complete.sh

# Start services
docker compose up -d
```

**That's it!** Access your monitoring dashboard at `http://your-server-ip:19999`

---

## 📂 Project Structure

```
nebula-selfhosted-paas/
├── apps/                    # Example applications
│   ├── python-app/         
│   ├── static-web/         
│   └── wordpress-app/      
├── config/                  # Configuration files
│   ├── fail2ban/           # Intrusion prevention rules
│   ├── netdata/            # Monitoring configuration
│   ├── nginx/              # Reverse proxy settings
│   └── ssh/                # SSH hardening configs
├── docs/                    # Documentation & diagrams
├── infrastructure/          # Docker compose files
│   └── docker/
│       ├── apps/           # Application containers
│       └── monitoring/     # Monitoring stack
├── scripts/                 # Automation scripts
│   ├── deploy.sh           # App deployment helper
│   └── setup_nebula_complete.sh  # Initial server setup
├── tests/                   # Test suites
│   ├── integration/
│   ├── load/
│   └── security/
├── docker-compose.yml       # Main compose file
├── docker-compose.prod.yml  # Production overrides
└── .env.example            # Environment template
```

---

## 🎓 About This Project

NEBULA was developed as part of a **Systems and Networks** final project (2º SMR, Curso 2025-2026) to demonstrate:

- Infrastructure as Code (IaC) best practices
- Docker containerization and orchestration
- Linux server hardening and security
- DevOps workflows with Git version control

**Objectives achieved:**
- ✅ Deploy multiple containerized apps with <200 MB monitoring overhead
- ✅ Implement automatic SSL certificate management
- ✅ Provide real-time observability without complex setup
- ✅ Achieve full data sovereignty at minimal cost

---

## 📊 Performance Benchmarks

| Metric | NEBULA (Netdata) | Alternative (Prometheus) |
|--------|------------------|--------------------------|
| RAM Usage (Idle) | ~150 MB | ~800-1200 MB |
| Dashboard Load Time | <3 seconds | 5-10 seconds |
| Configuration Complexity | One-line install | Multi-step setup |
| Data Retention | Real-time only | Requires persistent storage |

*Benchmarks based on 2 vCPU / 4 GB RAM VPS running 2-3 containerized apps*

---

## 🔒 Security Features

- **SSH Hardening:** Key-only authentication, non-standard port, root login disabled
- **Firewall Rules:** UFW blocks all ports except 80, 443, and custom SSH
- **Intrusion Prevention:** Fail2Ban auto-bans IPs after 5 failed login attempts
- **Container Isolation:** Docker namespaces and cgroups prevent privilege escalation
- **Automatic Updates:** Let's Encrypt certificates renew every 90 days

---

## 🤝 Contributing

This project welcomes contributions! To get started:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Mohamed Kamil El Kouarti Mechhidan**  
*Student, 2º SMR PROMETEO by thePower*  
Project Tutor: Raúl

📧 Contact: [GitHub Profile](https://github.com/MohamedKamil-hub)

---

## 🙏 Acknowledgments

- **Netdata** for lightweight, real-time monitoring
- **Docker** for containerization simplicity
- **Nginx Proxy Manager** for making SSL management painless
- **Let's Encrypt** for free SSL certificates
- The open-source community for making self-hosting accessible

---

<div align="center">

**⭐ If you find NEBULA useful, consider starring the repo!**

Made with ❤️ for students, developers, and self-hosting enthusiasts

</div>
# Test
