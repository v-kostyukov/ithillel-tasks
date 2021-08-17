### HW7. DNS
``` 
1. Зарегистрировать домен в любой зоне (бесплатно в зоне pp.ua).
2. Делегировать домен на любой name сервер (бесплатно на nic.ua / cloudflare.com, желательно на AWS Route53).
3. В зоне домена создать CNAME запись и направить ее на lms.ithillel.ua. Сообщить CNAME.
4. В зоне домена создать MX записи, такие же как у gmail.com.
5. В зоне создать CAA запись разрешающую только Let's Encrypt.
6. В зоне домена сделать glue записи.
7. В зоне домена сделать TXT запись c ключем _hillel и содержанием "I will work hard".
8. В зоне домена сделать SRV запись для сервиса LDAP, протокола TCP с приоритетом 100, весом 10 и портом из RFC 4511, и любым каноническим именем, которое существует в этой зоне.

Имя домена предоставить.
```
```
domain bravotest.tk
```
### Check dns records
``` 
dig -t cname lms.bravotest.tk

; <<>> DiG 9.11.26-RedHat-9.11.26-4.el8_4 <<>> -t cname lms.bravotest.tk
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 11632
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;lms.bravotest.tk.              IN      CNAME

;; ANSWER SECTION:
lms.bravotest.tk.       119     IN      CNAME   lms.ithillel.ua.
```
``` 
dig -t mx bravotest.tk

; <<>> DiG 9.11.26-RedHat-9.11.26-4.el8_4 <<>> -t mx bravotest.tk
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 23054
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;bravotest.tk.                  IN      MX

;; ANSWER SECTION:
bravotest.tk.           119     IN      MX      1 aspmx.l.google.com.
bravotest.tk.           119     IN      MX      5 alt1.aspmx.l.google.com.
bravotest.tk.           119     IN      MX      5 alt2.aspmx.l.google.com.
bravotest.tk.           119     IN      MX      10 alt3.aspmx.l.google.com.
bravotest.tk.           119     IN      MX      10 alt4.aspmx.l.google.com.
```
``` 
dig -t caa bravotest.tk

; <<>> DiG 9.11.26-RedHat-9.11.26-4.el8_4 <<>> -t caa bravotest.tk
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40532
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;bravotest.tk.                  IN      CAA

;; ANSWER SECTION:
bravotest.tk.           3599    IN      CAA     0 issue "digicert.com; cansignhttpexchanges=yes"
bravotest.tk.           3599    IN      CAA     0 issuewild "digicert.com; cansignhttpexchanges=yes"
bravotest.tk.           3599    IN      CAA     0 issue "comodoca.com"
bravotest.tk.           3599    IN      CAA     0 issue "letsencrypt.org"
bravotest.tk.           3599    IN      CAA     0 issuewild "comodoca.com"
bravotest.tk.           3599    IN      CAA     0 issuewild "letsencrypt.org"
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW7/img/screen1.png)
``` 
dig -t txt _hillel.bravotest.tk

; <<>> DiG 9.11.26-RedHat-9.11.26-4.el8_4 <<>> -t txt _hillel.bravotest.tk
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21027
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;_hillel.bravotest.tk.          IN      TXT

;; ANSWER SECTION:
_hillel.bravotest.tk.   119     IN      TXT     "I will work hard"
```
``` 
 dig -t srv _ldap._tcp.bravotest.tk

; <<>> DiG 9.11.26-RedHat-9.11.26-4.el8_4 <<>> -t srv _ldap._tcp.bravotest.tk
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 52397
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;_ldap._tcp.bravotest.tk.       IN      SRV

;; ANSWER SECTION:
_ldap._tcp.bravotest.tk. 119    IN      SRV     100 10 389 ds1.bravotest.tk.
```
### glue
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW7/img/screen2.png)
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW7/img/screen3.png)

