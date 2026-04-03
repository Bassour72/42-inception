# TLS 1.2
    curl -vk --tls-max 1.2 https://localhost
    curl -vk --tlsv1.2 https://localhost

# TLS 1.3
    curl -vk --tls-max 1.3 https://localhost
    curl -vk --tlsv1.3 https://localhost

# TLS 1.0 (should fail)
    curl -vk --tls-max 1.0 https://localhost
    curl -vk --tlsv1.0 https://localhost

docker exec -it adminer ps aux
docker exec -it adminer netstat -tln