### Bash
### portTest.sh
```
portTest.sh
Скрипт принимает на вход 1 параметр (номер порта)
Проверяет не занят ли этот порт и выводит соответствующее сообшение
Метод1 открывает порт средствами nc (netcat)
Метод2 проверяет что порт открыт 
```
#### Example checks
``` 
[root@localhost scripts]# ./portTest.sh 22
[+] Port 22 is open
[root@localhost scripts]# ./portTest.sh 53
[-] Port 53 is closed
[root@localhost scripts]#
```