---
---


# Applicatiecomponenten

Volgende applicatiecomponenten stellen de gebruikers in staat om hun taken uit te voeren.

## UiTPAS NFC kaart

De UiTPAS NFC kaart wordt gebruikt als fysieke identificatie van een persoon.

## Checkin device (CID)

Dit zijn autonome (onbemande) zuiltjes waar pashouders punten kunnen sparen. De zuil is gebouwd op Raspberry Pi technologie. Communicatie gebeurt over 3G, wifi of LAN.

Elk CID is een service consumer en is gekend in een kaartsysteem met een application key/secret.
Een CID wordt toegekend aan één of meerdere balies via het administrator dashboard. Alleen deze balies kunnen de CID beheren.
Er kan ingecheckt worden op een CID zodra deze is ingesteld op een event. Dat gebeurt volgens volgend algoritme.
Indien de baliemedewerker manueel een event heeft geselecteerd op beheer.uitpas.be wordt dit event gebruikt.
Indien er maar 1 event beschikbaar is dat ofwel door de balie georganiseerd wordt ofwel de balie als locatie heeft, wordt dit event gekozen.
Indien er meerdere events beschikbaar zijn, wordt het event gekozen waarvan het startuur het dichtstbij is.
Een pashouder die zijn UiTPAS tegen de NFC lezer van een CID houdt, zal inchecken op dit event, indien voldaan aan de restricties (tijdrestricties, maximum checkins per event).

## Publieke website

De publieke website kan de site van de stad of gemeente zijn of kan een aan het UiTPAS systeem toegwijde website zijn. CultuurNet stelt Drupal modules ter beschikking voor integratie met de UiTPAS backend. Meer informatie zie https://github.com/cultuurnet/culturefeed/wiki/Culturefeed-UiTPAS. Voorbeelden van dergelijke sites zijn www.uitpas.be en www.muntpunt.be/paspartoe.

## UiTPAS balie applicatie “beheer.uitpas.be”

Deze webapplicatie wordt gebruikt door baliemedewerkers om pashouders te registreren, pashouders een punt toe te kennen, welkomst/ruilvoordelen toe te kennen, UiTPAS’en te blokkeren, verkochte tickets aan kansenstatuut te registreren. beheer.uitpas.be is een op Drupal gebaseerde applicatie die draait binnen een JavaFX browser maar die ook via een normale browser toegankelijk is. De JavaFX browser maakt het mogelijk om kaarten te scannen.

## Smartphone app

Baliemedewerkers kunnen beschikken over een Android app waarmee ze pashouders kunnen inchecken, welkomst-/ruilvoordelen toekennen en verkochte tickets aan kansenstatuut kunnen registreren.
Administrator dashboard - de kaartsysteembeheerder beschikt over een webapplicatie om defaults in te stellen, balies te activeren, kaarten te beheren en welkomst-/ruilvoordelen in te stellen. De KSB heeft bewerkrechten op alle pashouders, balies, voordelen, UiTPAS’en etc die gelinkt zijn aan zijn kaartsysteem.
