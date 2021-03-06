---
---

# Geografisch zoeken

De fysieke coördinaten van een evenement worden geïndexeerd als ```physical_gis```.

Een zoekopdracht kan dus ook gefilterd en gesorteerd worden op basis van een locatie. Hiervoor wordt gebruik gemaakt van de Solr geofilt, bbox en geodist keywords.

| Parameter | beschrijving |
| -- | -- |
| pt | een fysiek punt weergegeven door GIS coördinaten  |
| sfield | het geïndexeerde fysieke punt, d.i. ```physical_gis```  |
| d  | de afstand in kilometer |


## Zoeken binnen een straal: geofilt

Geef alle resultaten waarvan de locatie binnen d km van pt gelegen is.

**Voorbeeld**
Alle resultaten waarvan de locatie gelegen is binnen 5 km van de coördinaat ```51.036906, 3.720739```.

```
{{site.search_api_server}}/searchv2/search?q=*.*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!geofilt}
```

## Alternatief: Bbox

Bbox staat voor bounding box. De bounding box is het vierkant dat de cirkel met straal d omvat. De bounding box bevat dus meer oppervlakte dan geofilt, maar het algoritme is eenvoudiger en performanter.

**Voorbeeld**

Alle resultaten waarvan de locatie gelegen is in het vierkant dat de cirkel met straal 5 km en met middelpunt ```51.036906,3.720739```

```
{{site.search_api_server}}/searchv2/search?q=*.*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!bbox}
```

## Zoeken op afstand: geodist

Geodist is de afstand tussen sfield en pt. Geodist gebruik je om te sorteren op afstand van een bepaalde locatie.

**Voorbeeld**

Alle documenten waarvan de locatie gelegen is binnen 5 km van het punt ```51.036906,3.720739``` gesorteerd op nabijheid:

```
{{site.search_api_server}}/searchv2/search?q=*:*&pt=51.036906,3.720739&sfield=physical_gis&d=5&fq={!geofilt}&sort=geodist()+asc
```

## Zoeken op postcode en straal

Het is ook mogelijk om te zoeken op postcode en straal rond postcode. Als fysiek punt wordt dan het centrum van de stad gebruikt.

**Voorbeeld**

Alle evenement in en nabij Gent:

```
{{site.search_api_server}}/searchv2/search?q=zipcode=9000!5km
```
