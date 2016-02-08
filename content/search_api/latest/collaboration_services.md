---
---

# Collaboration services

Collaboration services maken het mogelijk om eigen of andermans informatie uit te breiden met tags, vertalingen en links.

## Service endpoints

| Url | POST | DELETE |
| -- | -- | -- |
|{server}/api/v2/{event,production,actor}/{id}/translations	| X | X |
|{server}/api/v2/{event,production,actor}/{id}/keywords	 | X | X |
|{server}/api/v2/{event,production,actor}/{id}/links	 | X | X |


##Vertaling toevoegen

Method:
```
POST
```

URL:
```
{server}/api/v2/{event|actor|production}/{id}/translations
```

**Argumenten**

|Deel|	Beschrijving |Verplicht|
| -- | -- | -- |
|authenticatie|	Zie oAuth authenticatie via UiTID.|	X|
|lang|	Taal van de vertaling: NL, FR, EN, DU|	X|
|title|	Vertaling van de titel van het event of de naam van de actor	 ||
|shortdescription|	Vertaling van de korte beschrijving van het event (max 400 kars.)|	 |
|longdescription|	Vertaling van de lange beschrijving van het event	 |||

**Voorbeeld**

Request URL

```
{server}/api/v2/event/123/translation
```

Post data

```
lang=FR&
title=Dizorkestra%20en%20concert&
shortdescription=Concert%20Diz%C3%B4rkestra%2C%20un%20groupe%20qui.
```

Response

```
HTTP/1.1 200 OK
Cache-Control: no-cache
Pragma: no-cache
Content-Type: text/xml; charset=utf-8
Content-Encoding: deflate
Expires: -1
Date: Fri, 18 May 2012 07:59:11 GMT
Content-Length: 2142

<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>TranslationCreated</code>
  <link>http://www.uitdatabank.be/api/v2/event/{id}</link>
</rsp>
```

## Vertaling verwijderen

Method

```
DELETE
```

URL

```
{server}/api/v2/{event|actor|production}/{id}/translations
```

**Argumenten**

|Deel |	Beschrijving |	Verplicht|
| -- | -- |-- |
|Authenticatie|	Zie oAuth authenticatie via UiTID.	|X|
| lang|	Taal van de vertaling: FR, EN, DU|	X|

**Voorbeeld**

Request URL

```
http://www.uitdatabank.be/api/v2/event/123123/translations
```

Response

```
<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>TranslationWithdrawn</code>
  <link>http://www.uitdatabank.be/api/v2/event/{id}</link>
</rsp>
```


## Tag toevoegen

Method:
```
POST
```

URL:

```
{server}/api/v2/{event|actor|production}/{id}/keywords
```

**Argumenten**

|Deel	|Beschrijving|	Verplicht|
| -- | -- |-- |
|authenticatie	|Zie oAuth authenticatie via UiTID.	|X|
|keywords|	Eén of meer door ";" gescheiden tags|	X|
|visibles|	Eén of meer door ";" gescheiden booleans, default true|	 |

Bepaalde keywords zijn gereserveerd voor een beperkt aantal gebruikers. Dit zijn de zogenaamde "markers". Indien een marker wordt verzonden in naam van een gebruiker die niet over de geschikte rechten beschikt, wordt de marker uit de response gefilterd en wordt een foutboodschap verstuurd. Keywords worden toegevoegd tenzij er eerder een exacte match van het verzonden keyword werd toegevoegd (geen exacte duplicaten).

**Voorbeeld**

Request URL

```
http://www.uitdatabank.be/api/event/123123/keywords
```

Post data

keywords=keyword1;keyword2&visibles=true;false
Response

```
<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>KeywordsCreated</code>
  <link>http://www.uitdatabank.be/api/v2/event/{id}</link>
</rsp>
```

Request URL

http://www.uitdatabank.be/api/event/123123/keywords

Post data

keywords=laboratoire%20exp%C3%A9rimental&visibles=false
Response

```
<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>KeywordsCreated</code>
  <link>http://www.uitdatabank.be/api/v3/event/{id}</link>
</rsp>
```

## Tag verwijderen

Method:
```
DELETE
```

URL:
```
{server}/api/v2/{event|actor|production}/{id}/keywords
```

**Argumenten**

|Deel|	Beschrijving|	Verplicht|
| -- | -- |-- |
|authenticatie	|Zie oAuth authenticatie via UiTID.	|X|
|keyword|	Het te verwijderen keyword|X|

Het is enkel toegestaan keywords te verwijderen die door de betreffende auteur zelf werden toegevoegd.

**Voorbeeld**

Request URL

```
{server}/api/v2/event/123123/keywords
```

Post data

```

keyword=laboratoire%20exp%C3%A9rimental
Response

<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>KeywordWithdrawn</code>
  <link>http://test.rest.uitdatabank.be/api/v1/event/{id}</link>
</rsp>
```

##Link toevoegen

Method:
```
POST
```

URL:
```
{server}/api/v2/{event|actor|production}/{id}/links
```

**Argumenten**


|Deel|	Beschrijving|	Verplicht|
| -- | -- |-- |
|authenticatie|	Zie oAuth authenticatie via UiTID.|	X
|link|	Eén link|	X
|linktype	|Eén van volgende types: "video", "webresource", "reservations"|	X
|lang|	Taal van de link: "NL", "FR", "DE", "EN"|	X

**Voorbeeld**

Request URL

```
{server}/api/v2/event/123123/links?key=0689559111
```

Post data

```
link=https%3A%2F%2Ftickets23.ticketmatic.com%2Faddevent.php&linktype=reservations&lang=NL
```

Response

```
<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>LinkCreated</code>
  <link>http://www.uitdatabank.be/api/v2/event/{id}</link>
</rsp>
```

## Link verwijderen

Method:
```
DELETE
```
URL:
```
{server}/api/v2/{event|actor|production}/{id}/links
```

**Argumenten**

Veld	Beschrijving	Verplicht
authenticatie	Zie oAuth authenticatie via UiTID.	X
link	De te verwijderen link	X

**Voorbeeld**

Request URL

```
{server}/api/v2/event/123123/links
```

Post data

```
link=https%3A%2F%2Ftickets23.ticketmatic.com%2Faddevent.php
```

Response

```

<?xml version="1.0" encoding="UTF-8"?>
<rsp level=”INFO” version=”0.1”>
  <code>LinkWithdrawn</code>
  <link>http://www.uitdatabank.be/api/v2/event/{id}</link>
</rsp>

```
