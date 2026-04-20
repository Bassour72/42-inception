 curl ftp://localhost --user myuser:mypassword123
 echo "test file" > hello.txt
curl -T hello.txt ftp://localhost --user myuser:mypassword123
wget -m -nH -P wp-admin --ftp-user=myuser --ftp-password=mypassword123 ftp://172.18.0.6/wp-admin
curl -u myuser:mypassword123 ftp://localhost/Makefile -o MyNewFile 