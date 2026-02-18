# Alpine Nginx Docker

Dockerfile to run Nginx on Alpine Linux with a custom HTML page.

## Build

```bash

docker build -t my-alpine-nginx .

docker run -d -p 8080:80 my-alpine-nginx

