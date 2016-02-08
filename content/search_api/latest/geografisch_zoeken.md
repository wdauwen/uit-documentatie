---
---

# Geografisch zoeken

Als de fysieke coordinaten van een event bekend zijn, dan worden ze geindexeerd als physical_gis.

Een zoekopdracht kan dus ook gefilterd en gesorteerd worden op basis van een locatie. Hiervoor wordt gebruik gemaakt van de Solr geofilt, bbox en geodist keywords.

| Parameter | beschrijving |
| -- | -- |
| pt | een fysiek punt weergegeven door GIS coördinaten  |
| sfield | het geïndexeerde fysieke punt, d.i. “physical_gis”  |
| d  | de afstand in km |


## Zoeken binnen een straal: geofilt

Geef alle documenten waarvan de locatie binnen d km van pt gelegen is.

**Voorbeeld**
Alle documenten waarvan de locatie gelegen is binnen 5 km van ICC Gent

```
{server}/searchv2/search?q=*.*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!geofilt}
```

### Alternatief: Bbox

Bbox staat voor bounding box. De bounding box is het vierkant dat de cirkel met straal d omvat. M.a.w. de bounding box bevat alle punten die geofilt bevat, en meer. Het voordeel van bbox is dat het algoritme eenvoudiger is en de performantie dus beter.

**Voorbeeld**

Alle documenten waarvan de locatie gelegen is in het vierkant dat de cirkel met straal 5 km en middelpunt ICC Gent omvat:

```
{server}/searchv2/search?q=*.*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!bbox}
```

## Zoeken op afstand: geodist

Geodist is de afstand tussen sfield en pt. Geodist kan dus gebruikt worden om te sorteren op afstand van een bepaalde locatie.

**Voorbeeld**

Alle documenten waarvan de locatie gelegen is binnen 5 km van ICC Gent gesorteerd op nabijheid:

```
{server}/searchv2/search?q=*:*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!geofilt}&sort=geodist()+asc
```

## Zoeken op postcode en straal

Het is ook mogelijk om te zoeken op postcode en straal rond postcode. Als fysiek punt wordt dan het centrum van de stad gebruikt.

**Voorbeeld**

Alle evenement in en nabij Gent:

```
{server}/searchv2/search?q=zipcode=9000!5km
```
