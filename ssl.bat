@echo off
cd E:\Software\OpenSSL\bin\Key

set OPENSSL_CONF=E:\Software\OpenSSL\bin\openssl.cfg

set /p sname=Enter key name: 
openssl genrsa -out %sname%.key 2048
echo generated private key...
openssl rsa -in %sname%.key -pubout -out %sname%_public.key
echo generated %sname% public key
openssl req -new -key %sname%.key -out %sname%.csr
echo generated %sname%.csr certificate
set /p days=Enter validity days:
openssl x509 -in %sname%.csr -out %sname%.crt -req -signkey %sname%.key -days %days%
pause