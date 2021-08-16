### HW5. Troubleshooting — NC
``` 
Запустить nc в режиме ожидания входящих подключений на порту 5555, и передать в него сообщений HELLO.
Сделать скриншот получения сообщения HELLO до момента как nc вернет вам shell.
```
### Console output
``` 
nc -lp 5555
HELLO

nc 192.168.0.114 5555
HELLO
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW5/img/screen1.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW5/img/screen2.png)