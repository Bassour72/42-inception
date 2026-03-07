server {
    listen 80;
    server_name your.domain.com;

    location / {
        auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/.htpasswd;

        proxy_pass http://cadvisor:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
ss -tulpn | grep 8080



location /metrics/ {
    proxy_pass http://cadvisor:8080/metrics;
}

location /cadvisor/ {
    proxy_pass http://cadvisor:8080/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}