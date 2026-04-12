🔥 Question 1: Reverse Proxy Logic

Your Nginx receives a request:

https://ybassour.42.fr/cadvisor/

Explain step by step what happens from:

Browser → Nginx
Nginx → container
Container → response → back to browser

Include:

TLS termination
How routing is decided (location matching priority)
Why WordPress sometimes hijacks the request
🔥 Question 2: Docker Networking (real understanding, not copy-paste)

Inside your Docker network:

Why does http://cadvisor:8080 work only inside containers but not from host?
What exactly resolves the name cadvisor?
What breaks if you remove the custom network in Docker Compose?
🔥 Question 3: FastCGI vs HTTP

You clearly suffered with Adminer, so explain this properly:

Why does wget http://adminer:9000 fail?
What protocol is actually running on port 9000?
How does Nginx talk to Adminer correctly?
🔥 Question 4: Volumes and Persistence

You delete your WordPress container but keep volumes.

What data survives?
Why?
What happens if you remove volumes?
Where exactly is the data stored on the host?
🔥 Question 5: Process Model (this one exposes people)

Your container runs Nginx as PID 1.

Then you do:

docker exec -it nginx sh
Is sh now the main process?
What happens if Nginx (PID 1) crashes?
What happens if you exit the shell?
🔥 Question 6: TLS Deep Understanding

You configured:

ssl_protocols TLSv1.2 TLSv1.3;
Why must TLS 1.0 and 1.1 be disabled?
What exactly is encrypted after the handshake?
Why do you still see a warning in browser?
🔥 Question 7: Docker Layers (people fake this one a lot)

Why is Docker build fast sometimes and slow other times?
What is cached?
What breaks the cache?
🔥 Question 8: cAdvisor Role

You added cAdvisor.

What exactly does it monitor?
How does it get data from containers?
Why doesn’t it need direct integration with your app?

🔥 Question 9: Port Mapping Reality

Your Nginx uses:

443:443
Why don’t you expose WordPress (9000) to the host?
What would happen if you did?
Explain internal vs external traffic clearly

🔥 Question 10: Failure Scenario

MariaDB crashes.

What breaks first?
What does WordPress do?
How would you debug it step by step?