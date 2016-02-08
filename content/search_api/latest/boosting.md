---
---

# Boosting

Query time boosting

Via query time boosting is het mogelijk om de ranking die Solr op basis van de zoektermen aan de zoekresultaten toekent, te manipuleren. Voor meer informatie, zie http://wiki.apache.org/solr/SolrRelevancyFAQ.

Voorbeeld geef een hogere score aan documenten met “concert” in de titel dan aan documenten met “concert” in een ander veld



{server}/searchv2/search?q=concert&title:concert^2


Voorbeeld zoeken op concert en boosten op de waarde van bepaalde velden, in dit geval de som van recommended_count en comment_count.



{server}/searchv2/search?q={!boost+b=sum(recommend_count,comment_count)}concert&group=event


Een andere manier om documenten te boosten is via function queries. Dit is uitgelegd op http://wiki.apache.org/solr/FunctionQuery

Voorbeeld de score van nieuwe documenten boosten met een function query



{server}/searchv2/search?q={!boost+b=recip(ms(NOW,creationdate),3.16e-11,1,1)}concert&group=event
