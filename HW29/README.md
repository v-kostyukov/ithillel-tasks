### HW29. VPC Peering
``` 
Добавить пользователю hillel inline policy:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "ec2:GetManagedPrefixListEntries",
        "ec2:GetManagedPrefixListAssociations"
      ],
      "Resource": "*"
    }
  ]
}

Создать еще один VPC используя "20-битное" адресное пространство из RFC1918 в качестве CIDR Range.
Протегировать его по тем же принципам, что и первый VPC.
Создать в нем две приватные сети (NAT Gateway не создаем) в разных зонах доступности.
Протегировать сети по тем же принципам, как и предыдущие.
Создать одну общую для сетей таблицу маршрутизации.
Протегировать ее.
Создать VPC peering между первым и вторым VPC, настроить таблицы маршрутизации обоих VPC, чтобы ресурсы в разных VPC могли свободно коммуницировать между собой.
Учесть IPv4 CIDR нового VPC в конфигурации NACL в первом VPC.
```
### Add inline policy to user hillel
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen1.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen3.png)
### Create VPC

### Create VPC Peering
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen4.png)
### Create 2 subnet
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen5.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen6.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW29/img/screen7.png)

