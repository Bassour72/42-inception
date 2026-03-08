# Shell form and the Exec form


# 1 In your NGINX configuration, how do you distinguish between a request for a static image (like logo.png) and a request for a PHP file (like index.php)?
# 2 Why can't NGINX just "run" the PHP file itself? Why must it send it to Port 9000 of the WordPress container using the FastCGI protocol?

# 1 When you visit the site, NGINX sends the certificate to the browser.
# 2 The browser checks if the URL in the address bar matches the CN inside the certificate.
# 3 If they don't match, you get the scary "Your connection is not private" (ERR_CERT_COMMON_NAME_INVALID) error.

Where in your Dockerfile or tools script do you generate these?
Which tool do you use (OpenSSL?), and why must the Common Name (CN) match your login (e.g., mbatista.42.fr)?
[1] Docker Bridge Network Overview
[2] Docker Embedded DNS Server
[3] Docker Compose Networking Guide
[4] Configuring Subnets in Docker Compose


ما هي مكونات Docker Engine وكيف تعمل معاً؟
كيف يختلف Docker Engine عن تقنية VMware؟
ما الفرق بين إصدارات CE و EE لمحرك Docker؟
ما الفرق بين containerd و runc؟
كيف يساعد مكون Shim في تحديث Docker دون توقف؟
ما هي معايير OCI وكيف تؤثر على تصميم المحرك؟

ما هي وظيفة مكون الـ Shim وكيف يمنع توقف الحاويات؟
هل يمكن تشغيل حاويات ويندوز ولينكس معاً على نفس المحرك؟
ما الفرق بين إصدارات Docker CE و Docker EE؟
ما هي ميزة التحديث دون توقف في Docker؟
كيف يختلف shim عن containerd في المهام؟
هل يمكن تشغيل الحاويات إذا توقف محرك دوكر؟
ما هو دور الـ Namespaces والـ Cgroups في عمل runc؟
كيف يتعامل Shim مع المدخلات والمخرجات في الحاوية التفاعلية؟
ما الذي يحدث إذا توقف containerd أثناء تشغيل الحاوية؟
44

what is different between  Adminer and PhpMyAdmin


what is different between  Adminer and PhpMyAdmin


what is different between  Adminer and PhpMyAdmin
=======
the docker engine
the six part spearater into thress part 
docker-client CLI the docker command

Docker demon for AIP and other thing's

Containerd for check if the image under standrt of OCI  and i's hight level runtime and container supervoser like stop start ..
Shim Enable demonless container
runc take the image for containerd as OCI and craete conatiner runtime and interface to kernal primtive

#   *Docker engine*
*   **The Docker Client (CLI): The user-facing command-line interface. When you type a command like docker run, the Docker CLI acts as a "remote control," converting your request into an API call and sending it to the background daemon.**

*   **The Docker Daemon (dockerd): Often called the "brain" of the engine, this background service manages high-level logic like image building, network routing, and volume management. It listens for API requests and delegates the actual running of containers to lower-level tools.**

*   **Containerd (High-level Runtime): A specialized daemon that supervises the container lifecycle. Its job is to pull images from registries and ensure they conform to OCI (Open Container Initiative) standards. It handles starting, stopping, and pausing containers, but It does not execute the container process itself.containerd cannot actually create containers. It uses runc to do that. It converts the required Docker image into an OCI bundle and tells runc to use this to create a new containe.**

*   **The Shim (containerd-shim): A tiny process created for every running container. Its main purpose is to enable "daemonless" containers, meaning if the Docker daemon or containerd crashes or needs an update, the container keeps running because the shim stays behind to manage it.**

*   **runC (Low-level Runtime): The component that does the final "heavy lifting." It receives an OCI-compliant bundle (filesystem and config) from containerd and interacts directly with Linux Kernel primitives—like namespaces and cgroups—to build the isolated environment and start the containe**
