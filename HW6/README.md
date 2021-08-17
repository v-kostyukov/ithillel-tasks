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
nc -lp 9000
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
tcpdump -v -n -i lo port 9000 -w file.pcap
dropped privs to tcpdump
tcpdump: listening on lo, link-type EN10MB (Ethernet), capture size 262144 bytes
8 packets captured
16 packets received by filter
0 packets dropped by kernel

tcpdump -r file.pcap
reading from file file.pcap, link-type EN10MB (Ethernet)
dropped privs to tcpdump
21:55:03.132260 IP6 localhost.58130 > localhost.cslistener: Flags [F.], seq 2790821554, ack 3594150293, win 342, options [nop,nop,TS val 439854405 ecr 439803116], length 0
21:55:03.132463 IP6 localhost.cslistener > localhost.58130: Flags [F.], seq 1, ack 1, win 350, options [nop,nop,TS val 439854406 ecr 439854405], length 0
21:55:03.132521 IP6 localhost.58130 > localhost.cslistener: Flags [.], ack 2, win 342, options [nop,nop,TS val 439854406 ecr 439854406], length 0
21:55:08.858834 IP6 localhost.58132 > localhost.cslistener: Flags [S], seq 3873716201, win 43690, options [mss 65476,sackOK,TS val 439860132 ecr 0,nop,wscale 7], length 0
21:55:08.858851 IP6 localhost.cslistener > localhost.58132: Flags [S.], seq 1341988828, ack 3873716202, win 43690, options [mss 65476,sackOK,TS val 439860132 ecr 439860132,nop,wscale 7], length 0
21:55:08.858861 IP6 localhost.58132 > localhost.cslistener: Flags [.], ack 1, win 342, options [nop,nop,TS val 439860132 ecr 439860132], length 0
21:55:08.858900 IP6 localhost.58132 > localhost.cslistener: Flags [P.], seq 1:153, ack 1, win 342, options [nop,nop,TS val 439860132 ecr 439860132], length 152
21:55:08.858907 IP6 localhost.cslistener > localhost.58132: Flags [.], ack 153, win 350, options [nop,nop,TS val 439860132 ecr 439860132], length 0
```
