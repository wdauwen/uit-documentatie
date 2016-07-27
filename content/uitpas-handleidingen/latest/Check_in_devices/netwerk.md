---
---
## netwerk vereisten

Om een IP adres (en gateway en dns) te verkrijgen rekent de zuil op dhcp. hij geeft dan tijdens het opstarten zijn gekregen IP adress weer zodat u er indien nodig via ssh aan kan.

De zuil heeft dan wel een aantal open poorten nodig. 

* TCP 443 naar www.uitid.be(176.34.136.29) 
* TCP 80 naar www.uitid.be (176.34.136.29) & cidmonitor.lodgon.com (54.246.119.103) 
* TCP 8080 naar cidmonitor.lodgon.com (54.246.119.103) 
* UDP 123 (voor het contacteren van publieke ntp servers) 
