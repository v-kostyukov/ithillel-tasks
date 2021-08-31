### HW26. VPC Endpoint
``` 
В ранее созданном VPC делаем бесплатный VPC endpoint для S3 сервиса и добавляем его во все таблицы маршрутизации.
Для S3 VPC endpoint'а делаем политику, которая разрешит доступ к
 - Docker Hub
 - GitHub (github-production-release-asset-2e65be)
 - ECR
 - CentOS (mirrorlist.centos.org)
 - Amazon Linux (packages.*.amazonaws.com + repo.*.amazonaws.com)
```
### Create VPC Endpoint
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW26/img/screen1.png)







