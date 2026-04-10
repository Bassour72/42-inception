 curl ftp://localhost --user myuser:mypassword123
 echo "test file" > hello.txt
curl -T hello.txt ftp://localhost --user myuser:mypassword123
