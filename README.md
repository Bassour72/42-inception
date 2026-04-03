# ybassour
# 42-inception
📌 Project Overview  Inception is a system administration project from 42 School that introduces Docker and container orchestration. The goal is to build a secure, multi-container infrastructure running a WordPress website using Docker Compose, without relying on pre-built images.






# What is Containerization:
*   **Containerization is a method or technology used to package an application with only its necessary requirements, dependencies, and source code. This creates a container that can run consistently across multiple environments**


# What is Virtualization:
*   **"Virtualization is a technology used to virtualize hardware, allowing you to create Virtual Machines (VMs) that have their own dedicated resources (like CPU, RAM, and storage).**



# What is Hypervisor:
*   **hypervisor is The "manager" software that creates and runs the VMs**

# What is docker:
*   **Docker is an open-source platform used to manage the entire lifecycle of containers, including building, running, and distributing them.**


# What is VMs:
*   **Virtual Machines (VMs) The simulated "guest" computer that runs on that hardware. They are isolated, self-contained environments that run applications.**


# What is a Container:
*   **A container is a lightweight, standalone, and executable package that includes everything needed to run an application—code, runtime, system tools, libraries, and settings.**



# What is a docker image:
*   **A Docker image is an immutable, static file that serves as a standalone, executable software package. It includes everything needed to run an application: the source code, runtime, system tools, libraries, and environment settings.**

# dockerfile
# docker compose
# docker built-time
# docker run-time
#

# Docker Network Drivers

### 1. Bridge Driver (Default)
The **Bridge driver** creates a private internal network on the host. Containers in the same bridge network can communicate with each other (same subnet) but are **isolated** from the host’s external network unless ports are specifically mapped.

### 2. Host Driver
The **Host driver** removes network isolation between the container and the Docker host. The container does not get its own IP address; instead, it uses the **host's IP** directly and shares the host's networking namespace.

### 3. IPvlan Driver
The **IPvlan driver** gives users total control over IPv4 and IPv6 addressing. It connects containers to external networks or **VLANs** using the host's interface, but with better performance and less overhead than Macvlan.

### 4. Macvlan Driver
The **Macvlan driver** assigns a MAC address to each container, making it appear as a **physical device** on the network. The container connects directly to the physical network through the host's interface.

### 5. None Driver
The **None driver** completely disables the networking stack for a container. It provides the highest level of **isolation**, as the container has no external connectivity and no connection to other containers.

### 6. Overlay Driver
The **Overlay driver** is used in **Docker Swarm** or multi-host setups. It creates a distributed network across multiple Docker daemons, allowing containers on different physical hosts to communicate securely.



# Docker Storage & Persistence

In Docker, data persistence ensures that application data survives even if a container is stopped or deleted.

## 1. Storage Concepts
*   **Data Persistence:** Storing application data outside the container lifecycle using volumes or bind mounts.
*   **Daemon Storage Backends:** How the Docker daemon manages image layers and the writable "container layer" on the host disk.

---

## 2. Storage Mount Options

### A. Volume Mounts (Recommended)
Volumes are the preferred mechanism for persisting data generated and used by Docker containers.
*   **Managed by Docker:** They are stored in a part of the host filesystem that is managed entirely by Docker (`/var/lib/docker/volumes/` on Linux).
*   **Lifecycle:** They exist independently of the container. Deleting a container does not delete the volume.
*   **Performance:** They offer high performance and are ideal for databases (like MariaDB) or CMS content (like WordPress).
*   **Safety:** You should only interact with volume data through Docker commands; manual modification on the host is not recommended.

### B. Bind Mounts
Bind mounts link a specific, user-defined path on the host machine to a path in the container.
*   **Direct Access:** Both the host OS and the container can read/write to the same files simultaneously.
*   **Use Case:** Highly useful during development for source code sharing, but less "isolated" than volumes.
*   **Dependency:** They rely on the host machine having a specific directory structure already in place.

### C. tmpfs Mounts (Bonus)
*   **Non-Persistent:** Data is stored only in the host's **system memory (RAM)**.
*   **Security:** Useful for storing sensitive credentials or temporary state that should never be written to the host's disk or the container's writable layer.



# Virtual Machines vs Docker:

| Feature              | Virtual Machines (VMs)            | Docker (Containers)              |
-----------------------|-----------------------------------|:--------------------------------:|
| Virtualization Level | Virtualizes Hardware              | Virtualizes the Operating System |
| Architecture         | Includes a full Guest OS          | Shares the Host OS Kernel        |
| Management Tool      | Uses a Hypervisor (VirtualBox)    | Uses the Docker Engine           |
| Size                 | Large (Gigabytes)                 | Lightweight (Megabytes)          |
| Startup Time         | Minutes (must boot full OS)       | Seconds (process-based)          |
| Isolation            | Strong (hardware isolation)       | Process-level (shared kernel)    |
| Portability          | Low (tied to hypervisor/hardware) | High (runs anywhere with Docker) |
| Scalability          | Slow (heavy resource demand)      | Fast (easy to spin up/down)      |
-----------------------------------------------------------------------------------------------




## 1. Secrets vs Environment Variables


| Feature            | Environment Variables (ENV)       | Docker Secrets                    |
|:-------------------|:---------------------------------:|:---------------------------------:|
| **Security**       | Low (Visible in logs/inspect)     | High (Encrypted at rest/transit)  |
| **Storage**        | Stored in container config        | Stored in Docker database         |
| **Access**         | Available to all processes        | Mounted as a file in /run/secrets |
| **Best Use**       | Non-sensitive configuration       | Passwords, Keys, Certificates     |
| ------------------ | --------------------------------- | --------------------------------- |

## 2. Docker Network vs Host Network


| Feature            | Docker Network (Bridge)           | Host Network                      |
|:-------------------|:---------------------------------:|:---------------------------------:|
| **Isolation**      | High (Private internal subnet)    | None (Shared with Host OS)        |
| **Security**       | Firewall protected (iptables)     | Direct access to host services    |
| **Port Mapping**   | Required (e.g. -p 443:443)        | Not required (native ports)       |
| **Inception Use**  | Mandatory for project isolation   | Prohibited by subject rules       |
| ------------------ | --------------------------------- | --------------------------------- |

## 3. Docker Volumes vs Bind Mounts


| Feature            | Docker Volumes                    | Bind Mounts                       |
|:-------------------|:---------------------------------:|:---------------------------------:|
| **Management**     | Managed by Docker Daemon          | Managed by User/Host OS           |
| **Path on Host**   | Internal (/var/lib/docker)        | Any User Path (e.g. /home/data)   |
| **Security**       | High (Isolated from host users)   | Low (Host can modify/delete)      |
| **Behavior**       | Populates volume with image data  | Host folder overwrites container  |
| ------------------ | --------------------------------- | --------------------------------- |


# ------------------------------------------------------------------[DOCKER ENGINE]---------------------------------------------------------
## What is Docker-Client
*   **Docker Client (Command): You enter a command into the Docker CLI. The client translates this into a REST API call.**


## What is Docker-Daemon
*   **Docker Daemon (Processing): The daemon (dockerd) receives the API call. It manages high-level features like images, volumes, and networking. If the required image isn't local, the daemon pulls it from a registry like Docker Hub.**


## What is Container-Daemon
*   **containerd (Management): The daemon passes the request to containerd, a high-level runtime. It converts the Docker image into an Open Container Initiative (OCI) bundle—a folder containing the filesystem and a configuration file.**

## What is Container-Shim
*   **containerd-shim (Hand-off): containerd starts a small shim process for the new container. The shim's job is to sit between the runtime and the actual container to handle input/output and keep the container alive even if the daemon restarts.**


## What is Runc
*   **runc (Execution): The shim calls runc, the low-level runtime. runc interacts directly with the Linux Kernel to create the isolated environment using namespaces and control groups (cgroups). runc Exit: Once the container process has successfully started inside its isolated bubble,runc exits. It is only needed for the "start" phase.Running Container: The container is now in a "Running" state. The shim remains as the parent process to monitor the container and report its exit status back to**

# ----------------------------------------------------------------------------------------------------------------------------------------------


# What is cAdvisor?
**  *cAdvisor, short for Container Advisor, is an open-source tool developed by Google to monitor containers. It can collect, aggregate, process, and export container-based metrics such as CPU and memory usage, filesystem and network statistics. You can  easily use this tool in any containerized environment, ranging from a single Docker installation to a complete Kubernetes cluster.Kubecost uses cAdvisor as part of its.**

# Nginx
*  *Nginx is a high-performance open-source software that functions as a Web Server, Reverse Proxy, Load Balancer, and provides Basic Security (like SSL/TLS and rate limiting) for web services.**
*   *In my Inception infrastructure, Nginx serves as the sole entry point and a robust reverse proxy. It acts as the "gatekeeper" by receiving all incoming HTTPS traffic on port 443 and securely routing it to the appropriate internal services. Instead of exposing your WordPress, MariaDB, or Redis containers directly to the internet, Nginx intercepts the requests, handles the SSL/TLS termination, and then communicates with the PHP-FPM backend over the private Docker network. This setup not only hides your application's internal structure but also provides a centralized layer for managing security and traffic flow*
# Mariadb
*   *"MariaDB" is an open-source Relational Database Management System (RDBMS) that uses SQL to store, manage, and retrieve data for your WordPress site.*
# Redis
*   *Redis is an open-source, NoSQL in-memory data structure store. Unlike a relational database (RDBMS), it stores data as key-value pairs in RAM, making it extremely fast for caching and improving WordPress performance.*
# Ftp
*   *FTP (File Transfer Protocol) is a standard network protocol used to upload and download files between a client and a server. In this project, it allows a user to securely manage the WordPress files stored inside the container's volumes.*
# Wordpress
*   *WordPress is an open-source Content Management System (CMS) built on PHP. It allows users to easily create and manage blogs, e-commerce stores, or websites*
# Adminer
*   *Adminer (formerly phpMinAdmin) is a lightweight, web-based database management tool. It consists of a single PHP file that allows you to manage your MariaDB database through a graphical user interface (GUI) in your browser instead of using the command line*

# Static_site
*   *Static_site is a lightweight service in my infrastructure that serves pre-defined HTML/CSS files. It operates as a standalone container and is accessed through a specific route managed by your Nginx Reverse Proxy.*



# TLS Overview
## What is TLS

* **TLS** (Transport Layer Security) is a protocol used to secure communication between a client and a server by providing encryption, integrity, and authentication.
## Difference Between HTTP and HTTPS
*   **HTTP** (HyperText Transfer Protocol) is used to transfer data between client and server, but it is not secure (data is sent in plain text).
*   **HTTPS** (HyperText Transfer Protocol Secure) is HTTP over TLS, meaning the data is encrypted and protected.
## Difference: HTTPS uses encryption (TLS), HTTP does not.

## How TLS Works (Handshake Process)

# CLIENT (Browser) NGINX (Proxy)

## 1. Client Hello (TLS version, cipher suites, random number)

## 2. Server Hello (chosen cipher, random number, certificate + public key)

## 3. Verification: Client verifies the certificate using trusted Certificate Authorities (CA).

## 4. Key Exchange: Client generates a pre-master secret and encrypts it using the server's public key.

## 5. Decryption: Server decrypts it using its private key.

## 6. Session Start: Both generate the same symmetric session key.

=> All future communication is encrypted using symmetric encryption

# Certificates (Public Key, Private Key)
*   **A certificate contains the server’s public key and identity.**
*   **The public key is shared with clients.**
*   **The private key is kept secret on the server.**

# Certificate Authority (CA)
*   **A Certificate Authority (CA) is a trusted organization that signs certificates to verify the identity of a server.**

# Self-Signed Certificate vs Trusted Certificate
*   **Self-signed certificate: Generated and signed by yourself, not trusted by browsers by default.**
*   **Trusted certificate: Signed by a recognized CA and trusted by browsers and operating systems.**

# TLS Encryption (Symmetric vs Asymmetric)
*   **Symmetric encryption: Uses one shared key for encryption and decryption (fast, used after handshake).**
#   Asymmetric encryption: Uses a public key and private key (used during handshake).**

# TLS Termination (in Nginx)
*   **TLS termination means Nginx handles encryption/decryption, then forwards requests to backend services (WordPress, cAdvisor) over the internal Docker network.**

# Why Port 443 is Used
*   **Port 443 is the standard port for HTTPS (secure HTTP over TLS).**

# TLS in Reverse Proxy Architecture
*   **The client connects securely to Nginx using HTTPS.**
*   **Nginx decrypts the request and forwards it internally to containers (HTTP).**
*   **This centralizes security and simplifies backend services.**

# Security Benefits of TLS
*   **Encrypts data (confidentiality)**
*   **Protects data from modification (integrity)**
*   **Verifies server identity (authentication)**

# Common TLS Vulnerabilities (MITM, Weak Ciphers)
*   **Man-in-the-Middle (MITM): attacker intercepts communication**
*   **Weak ciphers: outdated encryption algorithms that can be broken**
*   **I   nvalid certificates: can lead to spoofing attacks**

# TLS Configuration Best Practices
*   **Use TLS 1.2 or 1.3 only**
*   **Disable weak ciphers and protocols**
*   **Use strong certificates (2048-bit or higher)**
*   **Redirect HTTP → HTTPS**
*   **Keep certificates updated**

# OpenSSL Role in TLS
*   **OpenSSL is a tool used to generate certificates, keys, and test TLS connections.**
*   **In this project, it is used to create the self-signed certificate for Nginx.**
