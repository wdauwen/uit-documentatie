---
---
## netwerk vereisten

Om een IP adres (en gateway en dns) te verkrijgen rekent de zuil op dhcp. hij geeft dan tijdens het opstarten zijn gekregen IP adress weer zodat u er indien nodig via ssh aan kan.

De zuil heeft dan wel een aantal open poorten nodig. 

* TCP 443 naar www.uitid.be(176.34.136.29) 
* TCP 80 naar www.uitid.be (176.34.136.29) & cidmonitor.lodgon.com (54.246.119.103) 
* TCP 8080 naar cidmonitor.lodgon.com (54.246.119.103) 
* UDP 123 (voor het contacteren van publieke ntp servers) 



Indien een dhcp server op de locatie echt niet mogelijk is kan de zuil een Vast IP adress krijgen. 

Om dit te doen moet de zuil eerst op een dhcp-capabel netwerk gehangen worden zodat we erop kunen inloggen (over ssh) 


hierna kunnen we de netwerk-instellingen wijzigen in de file /etc/network/interfaces 

Om een vast IP adress toe te kennen moetten we de lijn 


```
iface eth0 inet dhcp
```

vervangen door (voorbeeld is 192.168.1.130/24 netwerk, pas waarden aan naar nodig)   

```
iface eth0 inet static
       address 192.168.1.130
       netmask 255.255.255.0
       network 192.168.1.0
       broadcast 192.168.1.255
       gateway 192.168.1.250
```

en in /etc/resolv.conf moet ook de nameserver toegevoegd worden 

