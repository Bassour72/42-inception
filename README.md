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