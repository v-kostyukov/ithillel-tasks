### HW22. VPC Subnets
``` 
В созданом ранее VPC создать Subnet'ы в соответствии с теми подсетями, которые вы использовали в задаче по Адресному плану.
Все Subnet'ы протегировать такими же тегами, как и VPC, в теге Name указав название subnet по маске:

<имя VPC>—Private<порядковый номер> — для приватных
<имя VPC>—Public<порядковый номер> — для публичных

Две подсети из "24 битного блока" должны быть публичными, две подсети из "24 битного блока" должны быть приватными (NAT gateway не создаем).
Подсети из RFC 6598 должны быть приватными.
Для подсетей каждого типа использовать разные Availability Zones.
```
### Create Subnets
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW21/img/screen1.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW21/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW21/img/screen3.png)
