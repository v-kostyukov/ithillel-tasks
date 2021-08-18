### HW8. SSL/TLS
``` 
Выпустить wildcard сертификат от Let's Encrypt для выбранной ранее зоны.
С использованием алгоритма ECDSA и длиной ключа 384 и алгоритма RSA и длиной ключа 2048.
Сертификаты предоставить.
```
```
domain bravotest.tk
```
``` 
git clone https://github.com/Neilpang/acme.sh.git
cd ./acme.sh
apt-get install socat
./acme.sh --install
source ~/.bashrc
```
``` 
acme.sh --version
https://github.com/acmesh-official/acme.sh
v3.0.1
```
``` 
acme.sh  --register-account  -m admin@bravotest.tk --server zerossl
```
``` 
Допустимые значения для –keylength: 2048 (по умолчанию), 3072, 4096, 8192 или ec-256, ec-384.

acme.sh --issue -d *.bravotest.tk --webroot /var/www/html

acme.sh --issue --debug -d *.bravotest.tk --webroot /var/www/html --keylength ec-384
```