---
---

## Software architectuur van het Check-in device

De CID heeft als OS een linux systeem (raspbian, een versie van Debian) waar een Java FX applicatie op draait. 

Het management op OS niveau van de CID gebeurt via ssh (pi@ipadress). Het IP adress word weergegeven tijdens het opstarten van de zuil. 


De java aplicatie staat met zijn config files in de home dir van de pi user (/home/pi) 

 * java app : pi-''versienummer''.jar
 * config file : cid.config

Deze applicatie schrijft zijn  logs naar de file /tmp/cid.log , 
	
De laatste 50 lijnen zijn zichtbaar mbv commando 

<blockquote> tail -n 50 /tmp/cid.log </blockquote>
	
De rollende logs zijn zichtbaar mbv commando 

<blockquote> tail -f /tmp/cid.log </blockquote> (crtl-C stopt)




Deze Logs staan opgeslagen in een tmpfs filesystem .. dus herstarten van de zuil wist de logs. 


De logs worden ook Naar een monitoring server geschreven, je kan deze bekijken met de monitoring app die je kan downloaden op http://files.uitpas.be/CID_monitor/
