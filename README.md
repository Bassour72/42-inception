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

# ---------------------------------------------------------------------[DOCKER ENGINE]--------------------------------------------------------------------
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

# --------------------------------------------------------------------------------------------------------------------------------------------------------


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
