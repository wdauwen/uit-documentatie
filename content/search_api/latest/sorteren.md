---
---

# Sorteren

Solr maakt bij een query een ranking aan van documenten, d.w.z. ieder document krijgt een bepaalde score toegekend die aangeeft hoe relevant het document is in het kader van de betreffende search.

Wanneer de gebruiker geen sorteervolgorde aangeeft, worden de gevonden resultaten gerangschikt volgens die relevantie (de score van het document, een pseudoveld dat ook opgevraagd kan worden). Voor deze ranking maakt Lucene gebruik van het [tf.idf model](http://en.wikipedia.org/wiki/Tf–idf).

Op ieder niet-multivalued veld dat geïndexeerd is (zie Geïndexeerde velden) kan gesorteerd worden. Daarnaast kan er ook gesorteerd worden d.m.v. een functie (zie Geografisch zoeken).

## Sorteren op titel

Het sorteren op het veld title gaat niet omdat dat veld tokenized geindexeerd wordt en dus multivalued is. Daarom is er een title_sort voorzien waarmee op titel gesorteerd kan worden.

```
{server}/searchv2/search?q=*.*&sort=title_sort+asc
```

Als men binnen de sortering gebruik wil maken van de ranking van de documenten, dan moet men score desc meegeven aan de sort parameter.

```
{server}/searchv2/search?q=*.*&sort=title_sort+asc,score+desc
```
