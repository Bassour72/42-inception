docker run -d --name test-hacky nginx sh -c "nginx & tail -f /var/log/nginx/access.log"
docker top test-hacky
Here nginx as child procces and docker when i want to stop
└─> docker top test-hacky
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                24100               24076               1                   06:43               ?                   00:00:00            sh -c nginx & tail -f /var/log/nginx/access.log
root                24125               24100               0                   06:43               ?                   00:00:00            tail -f /var/log/nginx/access.log
root                24144               24100               0                   06:43               ?                   00:00:00            nginx: master process nginx
syslog              24145               24144               0                   06:43               ?                   00:00:00            nginx: worker process
syslog              24146               24144               0                   06:43               ?                   00:00:00            nginx: worker process
syslog              24147               24144               0                   06:43               ?                   00:00:00            nginx: worker process
syslog              24148               24144               0                   06:43               ?                   00:00:00            nginx: worker process

time docker stop test-hacky

test-hacky
real    0m10.567s  <-- This is the failure!
user    0m0.021s
sys     0m0.015s


docker run -d --name test-hacky nginx 
Here nginx as parent procces and docker when i want to stop

docker top test-hacky
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                25259               25236               0                   06:46               ?                   00:00:00            nginx: master process nginx -g daemon off;
syslog              25325               25259               0                   06:46               ?                   00:00:00            nginx: worker process
syslog              25326               25259               0                   06:46               ?                   00:00:00            nginx: worker process
syslog              25327               25259               0                   06:46               ?                   00:00:00            nginx: worker process
syslog              25328               25259               0                   06:46               ?                   00:00:00            nginx: worker process


 time docker stop test-hacky
test-hacky

real	0m1.469s
user	0m0.019s
sys	0m0.013s