
 #Option 1 (Best): Use wget instead of curl
docker exec -it nginx wget -qO- http://cadvisor:8080


location = /cadvisor {
        return 301 https://$host/cadvisor/;
    }

    # 2. The Reverse Proxy
    location ^~ /cadvisor/ {
        # The trailing slash at the end of the URL is vital here
        proxy_pass http://cadvisor:8080/;

        # Standard headers for container-to-container proxying
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # This helps cAdvisor understand it's behind a proxy
        proxy_redirect / /cadvisor/;
        
        # Disable buffering for real-time monitoring data
        proxy_buffering off;
        proxy_request_buffering off;
    }