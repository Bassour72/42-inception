# 42-inception
📌 Project Overview  Inception is a system administration project from 42 School that introduces Docker and container orchestration. The goal is to build a secure, multi-container infrastructure running a WordPress website using Docker Compose, without relying on pre-built images.
srcs/requirements/nginx/

srcs/requirements/wordpress/

srcs/requirements/mariadb/

srcs/docker-compose.yml 
# TODO:


What We Cover in Part 2

✔ What exactly a Linux Namespace is
✔ Why namespaces were created (process isolation, not Docker)
✔ PID namespace — why containers see PID 1
✔ NET namespace — how containers get their “own” network
✔ UTS namespace — custom hostname per container
✔ MNT namespace — isolated filesystem views
✔ USER namespace — mapping host users to container users
✔ Namespace life-cycle — when the namespace dies
✔ Why Docker uses clone() to copy namespace attributes
✔ What a shared namespace is (e.g., --network=host)
✔ Why namespaces are the reason containers look like mini-OSes
✔ How CGroups enforce resource limits
✔ CPU throttling, OOM kills, memory limits
✔ Real examples with PID maps, proc filesystem, and network stacks

This session demystifies EVERYTHING engineers misunderstand about container isolation.

If you're a Software Engineer, SSE, DevOps, or Architect, this knowledge is essential.

What You Will Understand After This Video

Why namespaces are NOT a Docker concept

Why each container sees PID 1

Why host sees all processes, but containers see isolated views

Why cgroups throttle CPU but cannot throttle memory

Why Java threads inside a container are NOT Linux processes

How Kubernetes uses these primitives

Why Windows and Linux namespaces are incompatible

How a namespace stays alive until the last process inside it exits

This is Docker as it actually works under the Linux kernel, including:

fork() vs exec()

clone()

overlayFS

container lifecycle

why containers are just processes

why they boot in milliseconds

why containers don’t have an OS

how FROM ubuntu gives a filesystem but not a kernel

why Windows containers can't run on Linux

how image layers become writable containers

If you ever misunderstood how Docker works, or you want to become a real architect, this session is for you.
How Docker actually works,
why it’s not a virtual machine,
how containers share the OS kernel,
and what really happens when you run a container

What is mariadb
what is wordpress
what nginx
what TLSv2
what is php-fpm
what is redis cache 
what is  FTP server 
what is  Adminer
and service the manage containers

PID 1 Responsibility: Why is it strictly forbidden in the subject to use "hacks" like tail -f /dev/null or infinite sleep loops to keep your containers running? What is the significance of PID 1 in a Docker container regarding signal handling (like SIGTERM)?
Alpine vs. Debian: Most students use alpine or debian:bullseye as a base. If you choose Alpine, why might you run into issues with glibc when compiling certain C-based PHP extensions, and how does the project's "building from source" rule affect this?
The NGINX-WordPress Link: In your docker-compose.yml, you connect NGINX to WordPress. Why must you use the service name instead of a hardcoded IP address, and which Docker mechanism makes this internal DNS resolution possible?
TLS 1.2/1.3 Enforcement: The subject requires NGINX with TLS. How do you configure your ssl_protocols in the NGINX config file to explicitly disallow older, insecure versions like SSLv3 or TLS 1.1?
Database Persistence: If you delete your MariaDB container and restart it, your WordPress data stays safe because of Volumes. Where exactly on the host machine does Docker store these named volumes by default?
PHP-FPM vs. Apache: The project usually requires PHP-FPM. Unlike a standard Apache setup, PHP-FPM doesn't handle HTTP requests directly. What specific FastCGI parameter must be passed from NGINX to the WordPress container so PHP knows which file to execute?
The MariaDB Root Myth: You are required to set up a database user for WordPress. Why is it a major security fail (and an evaluation "no-go") to let the WordPress application connect using the MariaDB root password?
The Entrypoint Script: To automate the WordPress installation (setting the site title, admin user, etc.), most use WP-CLI. How do you ensure this script only runs after the MariaDB container is fully initialized and ready to accept connections?
Docker Network Drivers: By default, Docker Compose creates a bridge network. If you had to make your services accessible only to each other and not to the outside world (except via the NGINX gateway), how would you configure the network's internal flag?
The Bonus - Redis Caching: When adding Redis as a bonus, which specific file in the WordPress root (/var/www/html/) must you modify to tell WordPress to use the Redis container as an object cache? 


----------------

*   **Docker Client (Command): You enter a command into the Docker CLI. The client translates this into a REST API call.**



*   **Docker Daemon (Processing): The daemon (dockerd) receives the API call. It manages high-level features like images, volumes, and networking. If the required image isn't local, the daemon pulls it from a registry like Docker Hub.**



*   **containerd (Management): The daemon passes the request to containerd, a high-level runtime. It converts the Docker image into an Open Container Initiative (OCI) bundle—a folder containing the filesystem and a configuration file.**


*   **containerd-shim (Hand-off): containerd starts a small shim process for the new container. The shim's job is to sit between the runtime and the actual container to handle input/output and keep the container alive even if the daemon restarts.**



*   **runc (Execution): The shim calls runc, the low-level runtime. runc interacts directly with the Linux Kernel to create the isolated environment using namespaces and control groups (cgroups). runc Exit: Once the container process has successfully started inside its isolated bubble,runc exits. It is only needed for the "start" phase.Running Container: The container is now in a "Running" state. The shim remains as the parent process to monitor the container and report its exit status back to**



*   *A container is a lightweight, standalone, and executable package that includes everything needed to run an application—code, runtime, system tools, libraries, and settings.**


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
