### HW15. AWS Service — CloudTrail
``` 
Создать trail, разместив его на S3 бакете, не используя шифрование, но используя валидацию логов.
Trail должен уметь логировать события во всех активных регионах.

Сообщить дату первой активности IAM пользователя hillel.
```
### Create trail
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW15/img/screen1.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW15/img/screen2.png)
### Date login user
```
"eventTime":"2021-08-30T05:25:32Z","eventSource":"signin.amazonaws.com","eventName":"ConsoleLogin",
"awsRegion":"us-east-1","sourceIPAddress":"91.207.249.240","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) 
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36","requestParameters":null,
"responseElements":{"ConsoleLogin":"Success"},
"additionalEventData":{"LoginTo":"https://console.aws.amazon.com/iam/home?state\u003dhashArgs%23%2Fusers%24new%3Fstep%3Dpermissions%26login%26userNames%3Dhillel%26passwordType%3Dmanual\u0026isauthcode\u003dtrue","MobileVersion":"No","MFAUsed":"No"},
"eventID":"9c44267b-019d-471c-a83a-f282f486fcbb","readOnly":false,"eventType":"AwsConsoleSignIn","managementEvent":true,
"eventCategory":"Management","recipientAccountId":"014675994238","tlsDetails":{"tlsVersion":"TLSv1.2","cipherSuite":"ECDHE-RSA-AES128-GCM-SHA256","clientProvidedHostHeader":"signin.aws.amazon.com"}},{"eventVersion":"1.08","userIdentity":
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW15/img/screen3.png)
