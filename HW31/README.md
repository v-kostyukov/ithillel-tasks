### HW31. PHD
``` 
Добавить пользователю hillel inline policy:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Health",
      "Effect": "Allow",
      "Action": [
        "health:Describe*"
      ],
      "Resource": "*"
    }
  ]
}

Включить AWS Health для AWS Organization.
```
### Add user hillel inline policy 
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW31/img/screen1.png)
### Enable AWS Health for AWS Organization
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW31/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW31/img/screen3.png)

