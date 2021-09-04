### HW34. DLM
``` 
Добавить пользователю hillel inline policy:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "dlm:GetLifecyclePolicies",
        "dlm:GetLifecyclePolicy",
        "dlm:ListTagsForResource"
      ],
      "Resource": "*"
    }
  ]
}

Создать политику для EBS snapshot на основе томов, которые содержат тег Environment со значением Study.
Описать политику.
Протегировать политику.
Назначит политике следующее рассписание: eжемесячно, 28 числа, в 3 часа утра.
Политика должна оставлять не мене двух snapshot'ов.
Активировать копирование тегов с тома.
```
### Add user hillel inline policy
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW34/img/screen1.png)
