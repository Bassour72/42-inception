Inception FTP Test

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

"Why don't we use the Host driver for Inception?"
Your Answer: "Because Inception requires isolation. The Host driver breaks the isolation between the container and the VM, which goes against the project's security goals."


"Why are we using Volumes instead of Bind Mounts for Inception?"
Your Answer: "The Inception subject requires us to use Volumes because they are managed by the Docker Daemon and provide better isolation. Bind mounts are less secure because they depend on the host's specific file structure, whereas volumes are portable and handled entirely by Docker."


Docker Fundamentals
Docker Architecture (Client, Daemon, Registry)
Docker Workflow (Build → Ship → Run)
Docker Images # DONE
Docker Containers
Difference Between Image and Container
Dockerfile Overview
Docker Build Process
Docker Layers and Caching
Docker Compose Overview
Multi-Container Architecture
Service Definition in Docker Compose
Container Lifecycle (Create, Start, Stop, Remove)
Docker Networking Basics
Bridge Network (Default)
Container Communication (DNS, Service Names)
Port Mapping (Host vs Container Ports)
Internal vs External Access
Docker Volumes
Data Persistence in Containers
Volumes vs Bind Mounts
Volume Use Cases (Database, WordPress)
Docker Isolation (Namespaces & Cgroups)
Resource Management (CPU, Memory Limits)
Environment Variables in Docker
Secrets Management (vs ENV)
Docker Security Basics
Image Security and Minimal Base Images
Container Isolation Risks
Docker Logs and Monitoring
Healthchecks in Docker
Debugging Containers
Container Restart Policies
Dependency Management Between Services
Docker vs Virtual Machines
Advantages and Limitations of Docker


What is diff between shell form and exec form

When you build new image then create container from this image. the container is running  as nginx  in foreground then you run like this docker exec -it nginx sh 
does the nginx still the mian proccess or sh and 

which past of docker engine that responsble for push image to register

the containerd is responsble of the create and run and stop a container.
first thing's it's check in metadata meta.db if it's first it's not exsit on this file 
If you  want to test the running container it's metadata it's found this id of the container and task active found the running process
if you check for the stoped container you found in metadata and not in active task and status exsting and stoped

the differnce between containerd & runc
the containerd is responsble for the lifecircle of contaoiner and mange image like pull  and push
the runc is responsble for create resource for the container that talk to kernal create cgroup and namespace
runc is connect to kernal to  create the resource to container cgroup and namespace 
cgroup of limit the resource like CUP and RAM and OI
namespace it's give the container ioslotion
like munt filesystem:root
namesapce of networing:container it's owan ip address
namwspace : UTS for ioslation hostname
namespace PID
