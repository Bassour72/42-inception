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
ما هي فوائد استخدام الشبكات المعرفة من قبل المستخدم؟
كيف يمكنني عزل حاويتين تماماً عن بعضهما في الشبكة؟
هل يؤثر حذف الحاوية على البيانات المخزنة في الـ Volumes؟

ما الفرق بين شبكة الجسر الافتراضية والشبكات التي ينشئها المستخدم؟
كيف يساعد نظام DNS الداخلي في تواصل الحاويات عبر أسمائها؟
هل يمكن لحاوية واحدة الاتصال بأكثر من شبكة في نفس الوقت؟

