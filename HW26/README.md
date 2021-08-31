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
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW26/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW26/img/screen3.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW26/img/screen4.png)
### Policy
``` 
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Access-to-specific-buckets",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::docker-images-prod",
                "arn:aws:s3:::docker-images-prod/*",
                "arn:aws:s3:::prod-eu-central-1-starport-layer-bucket/*",
                "arn:aws:s3:::github-production-release-asset-2e65be",
                "arn:aws:s3:::mirrorlist.centos.org/*",
                "arn:aws:ecr:eu-central-1:123456789123:repository/*",
                "arn:aws:s3:::packages.region.amazonaws.com/*",
                "arn:aws:s3:::repo.region.amazonaws.com/*"
            ]
        }
    ]
}
```
