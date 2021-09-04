### HW37. EC2 — Security Group
``` 
Создать Security groups в первом, созданном вами VPC, по приниципам тегирования, которые были использованы при создании VPC.

1. Создать общую группу, назвать ее и присвоить тегу Name название по маске <VPC>-generic.
В группе разрешить доступ через протокол ICMP для IPv4 для всего адерсного пространства в IPv4.
В группе разрешить доступ через протокол SSH для всего адресного пространства в IPv4.

2. Создать группу для web приложений, назвать ее и присвоить тегу Name название по маске <VPC>-web.
В группе разрешить доступ через протокол HTTP и HTTPS для всего адресного пространства в IPv4.

3. Создать группу для базы данных, назвать ее присвоить тегу Name название по маске <VPC>-psql.
В группе разрешить доступ к порту PostgreSQL для группы <VPC>-web.
```
### Create Security group generic
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW37/img/screen1.png)
### Create Security group web
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW37/img/screen2.png)
### Create Security group psql
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW37/img/screen3.png)
### List Security Groups
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW37/img/screen4.png)