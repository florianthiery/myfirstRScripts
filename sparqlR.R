#install.packages("WikidataQueryServiceR")
library(WikidataQueryServiceR)

# R's versions and release dates:
sparql_query <- 'SELECT ?siteLabel ?label ?site
WHERE {
   ?site wdt:P31/wdt:P279* wd:Q839954 ;
      wdt:P279 ?inst .
    ?inst rdfs:label ?label.
    FILTER(LANG(?label) = "en").
  ?site rdfs:label ?siteLabel.
    FILTER(LANG(?siteLabel) = "en").
}'
df <- query_wikidata(sparql_query)

View(df)
