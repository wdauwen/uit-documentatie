---
---

# Query syntax basics

In de q parameter kan zowel een full text search als een search op een specifiek veld gedefinieerd worden. Voorts kan gezocht worden op ranges. Er kunnen wildcards gebruikt worden. Er kan op exacte zoektermen gezocht worden. Er kunnen booleaanse operatoren gebruikt worden.


## Full text search

Om gebruik te maken van de full text zoekmogelijkheden van SOLR ken je een vrij tekstveld toe aan de q parameter.

```
{server}/searchv2/search?q=concert
```  

## Search op specifiek veld

Om in tegenstelling tot full text search slechts te zoeken op een deel van de metadata voorzie je de naam van het veld. Een overzicht van alle doorzoekbare velden is beschikbaar in Geïndexeerde velden.

```
{server}/searchv2/search?q=city:Gent
```

## Zoeken op range

Ook is het mogelijk om op een range te zoeken. Dit is vooral van toepassing om te zoeken binnen een tijdsbereik, of een getallenbereik. Voorbeelden zoeken op range:

```
{server}/searchv2/search?q=availablefrom:[NOW+TO+*]
```

```
{server}/searchv2/search?q=agefrom:[*+TO+16]
```

```
{server}/searchv2/search?q=city:[*+TO+Gent]
```

## Wildcards

De Search API ondersteunt wildcards bij het zoeken binnen één bepaald veld. In het kader van een full text search worden wildcards niet ondersteund. Beschikbare wildcards:

* Een vraagteken ( ? ) zoekt op één karakter
* Een asterisk ( * ) zoekt op 0 tot n karakters

Beide wildcards kunnen zowel in het begin, in het midden als op het einde van een zoekterm gebruikt worden.

Om het event met ID 85bf1975-ec66-4c8f-87f5-4f73774d80d5 te zoeken, kunnen dus volgende search opdrachten gelanceerd worden:

```
q=cdbid:*bf1975-ec66-4c8f-87f5-4f73774d80d5
```  

```
q=cdbid:?5bf1975-ec66-4c8f-87f5-4f73774d80d5
```

```
q=cdbid:85bf1975-ec*7f5-4f73774d80d5
```  

```
q=cdbid:85bf1975-ec66-4c8f-87f5-*
```

## Booleaanse operatoren

Het is mogelijk booleaanse operatoren AND, OR en NOT te gebruiken om termen in een full-text query te combineren maar ook voor metadata search (zoek op specifieke velden).

```
{server}/searchv2/search?q=cultuurcentrum AND berchem
{server}/searchv2/search?q=keywords:cultuurcentrum AND A-kaart AND city:Berchem
```

## Exacte zoektermen

Het is mogelijk te zoeken op exacte overeenkomsten met de gewenste zoekterm.

```
{server}/searchv2/search?q=location_label:”cultuurcentrum berchem”
```
