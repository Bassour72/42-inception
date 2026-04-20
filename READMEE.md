*This project has been created as part of the 42 curriculum by **[ybassour]**.*

## 📌 Project Overview
Inception is a system administration project from 42 School that introduces Docker and container orchestration.  
The goal is to build a secure, multi-container infrastructure running a WordPress website using Docker Compose, without relying on pre-built images.

# 🧱 Fundamentals

## What is Containerization # DONE
    Containerization is a method used to package an application with its dependencies, allowing it to run consistently across different environments. 

## What is Virtualization # DONE
    Virtualization allows running multiple virtual machines (VMs), each with its own OS and resources.

## What is a Hypervisor # DONE
    A hypervisor is the software that creates and manages virtual machines.

## Docker # DONE
    Docker is an open-source platform used to build, run, and manage containers.

## Virtual Machines (VMs) # DONE
    VMs are isolated systems that include a full operating system.

## Containers # DONE
    A container is a lightweight runtime environment that includes everything needed to run an application.

## Docker Image # DONE
    A Docker image is an immutable file that contains the application and its environment.  # DONE

## Docker Container # DONE
A container is a running instance of a Docker image.

## Difference Between Image and Container # DONE
    - Image = blueprint (static)
    - Container = running instance (dynamic)

# ⚙️ Docker Architecture

## Docker Architecture (Client, Daemon, Registry)  # DONE
    - Client sends commands
    - Daemon processes requests
    - Registry stores images

## Docker Workflow (Build → Ship → Run) # DONE
    1. Build image
    2. Push to registry
    3. Run container

---

# 🏗️ Docker Build System

## Dockerfile Overview # DONE
    Defines how to build an image.

## Docker Build Process # DONE
    Docker reads the Dockerfile and creates image layers.

## Docker Layers and Caching # DONE
    Each instruction creates a layer. Cached layers improve performance.

---

# 🧩 Docker Compose & Multi-Container

## Docker Compose Overview # DONE
    Tool to manage multiple containers using a YAML file.

## Multi-Container Architecture # DONE
    Each service runs in its own container.

## Service Definition in Docker Compose # DONE
    Defines image, ports, volumes, and dependencies.

## Dependency Management Between Services # DONE
    Controls startup order and communication between containers.

---

# 🔄 Container Lifecycle

## Container Lifecycle # DONE
    - Create
    - Start
    - Stop
    - Remove

## Container Restart Policies # DONE
    Defines behavior when a container stops.

---

# 🌐 Docker Networking

## Docker Networking Basics # DONE
    Containers communicate using networks.

## Bridge Network (Default)  # DONE
    Private internal network for containers.
 
## Container Communication (DNS, Service Names) # DONE
    Containers communicate using service names (not IP).

## Port Mapping (Host vs Container Ports) # DONE
    Maps container ports to host ports (e.g., 443 → 8080).

## Internal vs External Access # DONE
    - Internal: container-to-container
    - External: user to container via exposed ports

---

# 💾 Docker Storage

## Docker Volumes  # DONE
    Managed storage for persistent data.

## Data Persistence in Containers  # DONE
    Data survives container deletion.

## Volumes vs Bind Mounts  # DONE
    - Volume: managed by Docker
    - Bind mount: linked to host path

## Volume Use Cases # DONE
    - Databases (MariaDB)
    - CMS data (WordPress)

---

# 🔒 Isolation & Resources

## Docker Isolation (Namespaces & Cgroups) # DONE
    - Namespaces isolate processes
    - Cgroups control resources

## Resource Management (CPU, Memory Limits) # DONE
    Limits container resource usage.

---

# 🔑 Configuration & Secrets

## Environment Variables in Docker # DONE
    Used for configuration.

## Secrets Management (vs ENV)  # DONE
    Secrets are more secure than environment variables.

---

# 📊 Monitoring & Debugging

## Docker Logs and Monitoring # DONE
    View container logs and metrics.

## Healthchecks in Docker # DONE
    Check if container is running correctly.

## Debugging Containers # DONE
    Tools and logs used to troubleshoot issues.

---

# 🛡️ Security

## Docker Security Basics # DONE
    Basic practices to secure containers.

## Image Security and Minimal Base Images # DONE
    Use small, trusted images.

## Container Isolation Risks # DONE
    Containers share kernel → weaker than VMs.

---

# ⚖️ Comparison

## Docker vs Virtual Machines  # DONE

|  Feature  |    VMs   | Containers |
|-----------|----------|------------|
| Size      | Large    | Small      |
| Speed     | Slow     | Fast       |
| Isolation | Strong   | Moderate   |

## Advantages and Limitations of Docker # DONE
    - Fast and lightweight
    - Less isolation than VMs

---

# 🌍 Services in Inception

## Nginx # DONE
    Reverse proxy and entry point handling HTTPS.

## MariaDB # DONE
    Database system storing WordPress data.

## Redis # DONE
    In-memory cache for performance.

## FTP # DONE
    Used to manage files in containers.

## WordPress # DONE
    Content management system.

## Adminer # DONE
    Web-based database management tool.

## Static Site # DONE
    Serves static HTML/CSS content.

## cAdvisor # DONE
    Monitors container resource usage.

---

# 🔐 TLS (HTTPS)

## What is TLS # DONE
    TLS secures communication between client and server.

## HTTP vs HTTPS # DONE
    - HTTP: not secure
    - HTTPS: encrypted using TLS

## TLS Handshake # DONE
    1. Client Hello  
    2. Server Hello  
    3. Certificate Verification  
    4. Key Exchange  
    5. Session Key Creation  

## Certificates   # DONE
    Contain public key and server identity.

## Certificate Authority (CA) # DONE
    Trusted entity that signs certificates.

## Self-Signed vs Trusted Certificate # DONE
    - Self-signed: not trusted by browsers  
    - Trusted: signed by CA  

## Encryption # DONE
    - Symmetric: fast, used after handshake  
    - Asymmetric: used during handshake  

## TLS Termination # DONE
    Nginx handles encryption and forwards requests internally.

## Port 443 # DONE
    Standard port for HTTPS.

## Reverse Proxy with TLS # DONE
    Nginx decrypts traffic and routes to containers.

## Security Benefits # DONE
    - Encryption  
    - Integrity  
    - Authentication  

## Common Vulnerabilities # DONE
    - MITM attacks  
    - Weak ciphers  
    - Invalid certificates  

## Best Practices # DONE
    - Use TLS 1.2/1.3  
    - Disable weak ciphers  
    - Redirect HTTP → HTTPS  

## OpenSSL # DONE
    Used to generate certificates and keys.

---

## 🤖 AI Usage Disclosure # DONE
    The theoretical content and structural organization of this README file were drafted and formatted with the assistance of AI to ensure clear and concise explanations of the project's technical concepts.