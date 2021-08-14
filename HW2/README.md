### Bash
### portTest.sh
```
portTest.sh
Скрипт принимает на вход 1 параметр (номер порта)
Проверяет не занят ли этот порт и выводит соответствующее сообшение
Метод1 открывает порт средствами nc (netcat)
Метод2 проверяет что порт открыт 
```
### Example checks
``` 
[root@localhost scripts]# ./portTest.sh 22
[+] Port 22 is open
[root@localhost scripts]# ./portTest.sh 53
[-] Port 53 is closed
[root@localhost scripts]#
```
### nginx.sh
``` 
nginx.sh
Скрипт устанавливает nginx и запускает его на порт 81
При входе на $IP:81/test перенаправляет на google.com
Добавить в автозагрузку
Запретить его обновление
```
### Example checks
``` 
curl -v http://localhost:81
* Rebuilt URL to: http://localhost:81/
* Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 81 (#0)
> GET / HTTP/1.1
> Host: localhost:81
> User-Agent: curl/7.61.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.14.1
< Date: Sat, 14 Aug 2021 12:40:39 GMT
< Content-Type: text/html; charset=utf-8
< Content-Length: 4057
< Last-Modified: Mon, 07 Oct 2019 21:16:24 GMT
< Connection: keep-alive
< ETag: "5d9bab28-fd9"
< Accept-Ranges: bytes
<
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title>Test Page for the Nginx HTTP Server on Red Hat Enterprise Linux</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style type="text/css">
            /*<![CDATA[*/
            body {
......................................................................................

curl -v http://localhost:81/test
* Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 81 (#0)
> GET /test HTTP/1.1
> Host: localhost:81
> User-Agent: curl/7.61.1
> Accept: */*
>
< HTTP/1.1 302 Moved Temporarily
< Server: nginx/1.14.1
< Date: Sat, 14 Aug 2021 12:42:37 GMT
< Content-Type: text/html
< Content-Length: 161
< Connection: keep-alive
< Location: https://google.com
<
<html>
<head><title>302 Found</title></head>
<body bgcolor="white">
<center><h1>302 Found</h1></center>
<hr><center>nginx/1.14.1</center>
</body>
</html>
```