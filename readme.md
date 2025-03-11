# Muse Knowledge Proxy - Docker Deployment

This repository contains a **Dockerized deployment** of **Muse Knowledge Proxy**, allowing for quick and scalable deployments.

## 🚀 Features
- Runs Muse Knowledge Proxy inside a **Docker container**.
- Supports **environment variables** for configuration.
- Exposes required **ports** (9797 for HTTP, 9443 for HTTPS).
- Provides a **Docker Compose setup** for easy multi-container management.

---

## 📜 Prerequisites
- **Docker** (https://docs.docker.com/get-docker/)
- **Docker Compose** (https://docs.docker.com/compose/install/)

---

## 🛠 Environment Variables

The following environment variables can be set for configuration:

| Variable             | Default  | Description |
|----------------------|---------|-------------|
| `INSTALL_DIR`       | `/opt/muse` | Installation directory |
| `LICENSE_FILE`      | `/opt/muse/license.lic` | Path to the license file |
| `PROXY_PORT`        | `9797` | HTTP Proxy Port |
| `SSL_PROXY_PORT`    | `9443` | HTTPS Proxy Port |
| `ADMIN_PASSWORD`    | `admin1234` | Admin password |

---

## 📦 Installation & Usage

### 🏗 **1. Build the Docker Image**
```sh
docker build -t muse-proxy .
```