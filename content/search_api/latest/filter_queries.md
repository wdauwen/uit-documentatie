---
---

# Filter queries

Het is mogelijk om een resultaatset van documenten te filteren met een filter query.

De termen die in de filter query gebruikt worden, hebben geen invloed op de score van een document. Bij het uitvoeren van een filter query wordt het ranking algoritme dus niet uitgevoerd, wat een filter query performanter maakt.

Het is dan ook aan te raden om de search termen die de ranking van de documenten niet moeten beïnvloeden, in de filter query te stoppen. Voorbeeld zoeken van alle documenten die de term “concert” bevatten met locatie Gent.

```
{server}/searchv2/search?q=concert&fq=city:Gent
```

Er kan meer dan één filter query doorgegeven worden. Het resultaat bevat alleen documenten die zich in de doorsnede van alle filter queries bevinden.

```
{server}/searchv2/search?q=concert%20&fq=city:Gent&fq=agefrom:18
```
