### HW42. Security in DevOps
``` 
1. Anchore server.
1.1 Set up Anchore server (https://github.com/anchore/anchore-engine/blob/b5e45c522f9c3e0a73e452eb3d101154d65e221c/docker-compose-dev.yaml)
1.2 Analyse base images (Centos, Debian, Alpine, ?)
1.3 Choose more security base image.
Definition of done:
- rating of docker images. It should include total number of vulnerabilities, total number if critical/high vulnerabilities.

2. OWASP plugin.
2.1 Download plugin (https://github.com/jeremylong/DependencyCheck)
2.2 Scan any Java artifact: export JAVA_OPTS=-Xss8192k; bash dependency-check/bin/dependency-check.sh -f JSON -s 
artifact_name --out report_file_name
Definition of done:
- generated json report

3. https://www.root-me.org/en/Challenges
3.1 https://www.root-me.org/en/Challenges/Network/SSL-HTTP-exchange (https://wiki.wireshark.org/TLS#TLS_Decryption)
3.2 https://www.root-me.org/en/Challenges/Network/Netfilter-common-mistakes
3.3 https://www.root-me.org/en/Challenges/Network/HTTP-DNS-Rebinding - optional
Definition of done:
- registered name in www.root-me.org
- screenshot with passed challenges
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW42/img/screen1.png)
