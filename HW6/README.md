### HW6. Troubleshooting — Tcpdump/curl
``` 
Записать дамп сетьевого трафика в файл в обе стороны (исходящий и входящий) с помощью утилиты curl, посылающей пустой пост запрос по пути /post на localhost на порт 9000.
```
``` 
# Запускаем nc в режиме ожидания входящих подключений на порту 9000
nc -lp 9000

# Захватываем сетевой трафик в файл
tcpdump -v -i lo src localhost and dst port 9000 -w file.pcap

# curl посылаем пустой пост запрос по пути /post на localhost
curl -v -d /post localhost:9000
```
### Console output
``` 
nc -lp 5555
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW6/img/screen1.png)
```
curl -v -d /post localhost:9000
* Rebuilt URL to: localhost:9000/
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 9000 (#0)
> POST / HTTP/1.1
> Host: localhost:9000
> User-Agent: curl/7.61.1
> Accept: */*
> Content-Length: 5
> Content-Type: application/x-www-form-urlencoded
>
* upload completely sent off: 5 out of 5 bytes
```
``` 
tcpdump -v -i lo src localhost and dst port 9000 -w file.pcap
dropped privs to tcpdump
tcpdump: listening on lo, link-type EN10MB (Ethernet), capture size 262144 bytes
5 packets captured
10 packets received by filter
0 packets dropped by kernel

tcpdump -r file.pcap
reading from file file.pcap, link-type EN10MB (Ethernet)
dropped privs to tcpdump
21:57:44.696902 IP6 localhost.59418 > localhost.cslistener: Flags [S], seq 3714731542, win 43690, options [mss 65476,sackOK,TS val 1723683216 ecr 0,nop,wscale 7], length 0
21:57:44.696929 IP6 localhost.59418 > localhost.cslistener: Flags [.], ack 2434072037, win 342, options [nop,nop,TS val 1723683216 ecr 1723683216], length 0
21:57:44.696968 IP6 localhost.59418 > localhost.cslistener: Flags [P.], seq 0:152, ack 1, win 342, options [nop,nop,TS val 1723683216 ecr 1723683216], length 152
21:58:46.725805 IP6 localhost.59418 > localhost.cslistener: Flags [.], ack 1, win 342, options [nop,nop,TS val 1723745245 ecr 1723683216], length 0
21:59:48.165115 IP6 localhost.59418 > localhost.cslistener: Flags [.], ack 1, win 342, options [nop,nop,TS val 1723806684 ecr 1723745245], length 0
```
