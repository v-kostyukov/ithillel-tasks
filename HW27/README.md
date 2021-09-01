### HW27. VPC Network ACL
``` 
Создать Network ACL c правилами, как в default Network ACL. Ассоциировать его со всеми публичными сетями.
Создать Network ACL и ассоциировать его со всеми приватными сетями. Разрешить доступ к сетям из "24 битного блока" по обоим направлениям и запретить доступ к сетям из RFC 6598 для входящего трафика.
Network ACLs тегируем теми же тегами, что и VPC.
Тег Name формируем по маске:
    <имя VPC>—Private — для приватных подсетей,
    <имя VPC>—Public — при публичных подсетей.
```
### Create VPC Network ACL
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen1.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen3.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen4.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen5.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen6.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen7.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW27/img/screen8.png)
