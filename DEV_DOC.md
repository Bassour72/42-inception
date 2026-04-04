# 🛠️ Developer Documentation
---
### Project Structure

- `docker-compose.yml` → Defines all services, networks, and volumes  
- `Makefile` → Automates build, run, stop, and cleanup  
- `.env` → Stores environment variables and secrets  

---

### Core Services

- `nginx/` → Reverse proxy  
  - Handles HTTPS (TLS)  
  - Routes traffic to internal services  

- `wordpress/` → WordPress application  
  - Runs with PHP-FPM  
  - Connects to MariaDB for data storage  

- `mariadb/` → Database server  
  - Stores WordPress data  
  - Uses persistent volumes  

---

### Bonus Services

- `redis/` → In-memory cache  
  - Improves WordPress performance  
  - Reduces database load  

- `ftp/` → File transfer service  
  - Allows uploading files to WordPress  
  - Uses authentication and isolated access  

- `adminer/` → Database management tool  
  - Web interface to manage MariaDB  
  - Useful for debugging and inspection  

- `cadvisor/` → Container monitoring  
  - Tracks CPU, memory, and network usage  
  - Provides real-time container metrics  

- `static-site/` → Simple web service  
  - Serves static content (HTML/CSS)  
  - Used for testing or additional service exposure  

---

### Supporting Directory

- `requirements/` →  
  Contains Dockerfiles and configuration files for each service  

---

### Key Concepts

- Services communicate via **Docker network using service names**  
- Data is stored in **volumes**, not inside containers  
- Containers are **ephemeral** (they can be destroyed and recreated)  
- Configuration is centralized using `.env`  

---
## 19. Project Setup & Management

### 1. Prerequisites

Make sure the following tools are installed:

- Docker
- Docker Compose
- Make

Verify installation:

- `docker --version`
- `docker compose version`
- `make --version`

---

### 2. Initial Setup

Before running the project:

1. Clone the repository  
2. Create and configure `.env` file:
   - Database credentials  
   - WordPress configuration  
   - FTP credentials  
   - cAdvisor credentials  

3. Ensure required directories exist:
   - Volumes (e.g. `/home/${USER}/data/` if using bind mounts)  

---

### 3. Project Structure

- `docker-compose.yml` → Defines services and network  
- `Makefile` → Automates project commands  
- `.env` → Environment variables  
- `nginx/` → Reverse proxy configuration  
- `wordpress/` → WordPress files  
- `mariadb/` → Database configuration  
- `requirements/` → Dockerfiles and configs  

---

### 4. Build & Run the Project

- `make`

This will:

- Build all Docker images  
- Create network and volumes  
- Start all containers  

---

### 5. Restart the Project

- `make re`

This will:

- Rebuild all images  
- Restart all containers  

---

### 6. Stop the Project

- `make down`

This will:

- Stop all containers  
- Remove containers and network  
- Keep volumes (data is preserved)  

---

### 7. Stop & Remove the Project

Remove everything (containers, images, volumes):

- `make fclean`

This will:

- Stop and remove all containers  
- Remove Docker images  
- Remove volumes  

⚠️ This will permanently delete:

- WordPress data  
- MariaDB database  

---

### 8. Container Management Commands

- `docker ps` → Running containers  
- `docker ps -a` → All containers  
- `docker logs <container>` → View logs  
- `docker exec -it <container> sh` → Access container shell  

---

### 9. Networking & Connectivity

Containers communicate using **service names (DNS)**:

- Example: `mariadb:3306`, `cadvisor:8080`

---

Test connectivity:

- `docker exec -it nginx ping cadvisor`  
- `docker exec -it nginx wget -qO- http://cadvisor:8080`

---

Notes:

- Commands must run inside a container  
- Host machine cannot access internal service names  
- If HTTP works but ping fails → normal  

---

### 10. Port Mapping

Only Nginx exposes a port to the host:

- `443:443`  

Internal services:

- WordPress → `9000`  
- MariaDB → `3306`  
- cAdvisor → `8080`  

These ports are only accessible inside the Docker network.

---

### 11. Service Dependencies

- WordPress depends on MariaDB  
- Nginx depends on WordPress  

Docker Compose controls startup order, but not readiness.

---

### 12. Volume Management

- `docker volume ls` → List volumes  
- `docker volume inspect <name>` → Inspect volume  
- `docker volume prune` → Remove unused volumes  

---

### 13. Data Persistence

Stored in Docker volumes:

- WordPress → `/var/www/wordpress`  
- MariaDB → `/var/lib/mysql`  

Properties:

- Persists after container restart  
- Deleted only with `make fclean` or manual removal  

---

### 14. Environment Variables

- `docker exec -it <container> env`  
- `docker inspect <container>`  

Used for:

- Debugging configuration  
- Verifying `.env` values  

---

### 15. Nginx Debugging

- `docker exec -it nginx nginx -t` → Test config  
- `docker exec -it nginx nginx -s reload` → Reload service  

---

### 16. Monitoring

Access:

- https://ybassour.42.fr/cadvisor  

Provides:

- CPU usage  
- Memory usage  
- Network activity  

---

### 17. TLS Version Testing

Test supported TLS versions:

---

TLS 1.0 (should FAIL ❌):

- `docker exec -it nginx openssl s_client -connect localhost:443 -tls1`

---

TLS 1.1 (should FAIL ❌):

- `docker exec -it nginx openssl s_client -connect localhost:443 -tls1_1`

---

TLS 1.2 (should SUCCESS ✅):

- `docker exec -it nginx openssl s_client -connect localhost:443 -tls1_2`

---

TLS 1.3 (should SUCCESS ✅):

- `docker exec -it nginx openssl s_client -connect localhost:443 -tls1_3`

---

Expected behavior:

- TLS 1.0 / 1.1 → connection fails  
- TLS 1.2 / 1.3 → connection succeeds  

This confirms secure configuration:

- `ssl_protocols TLSv1.2 TLSv1.3;`

---

### 18. Common Debugging Workflow

1. Check containers:
   - `docker ps`

2. Check logs:
   - `docker logs <container>`

3. Test connectivity:
   - `wget http://service:port`

4. Check Nginx:
   - `nginx -t`

5. Check environment:
   - `env`

---

### 19. Cleanup Commands

- `make fclean` → Full reset  
- `docker system prune -a` → Remove unused resources  
- `docker volume prune` → Remove unused volumes  

---
