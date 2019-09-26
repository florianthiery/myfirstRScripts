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

typeof(df)

df2 <- as.data.frame(df)

typeof(df2)

View(df2)

library(ggplot2)

ggplot()+
  geom_bar(data = df2, aes(x = label, fill = label))+
  labs(y = "A",
       title = "B")+
  theme_dark()