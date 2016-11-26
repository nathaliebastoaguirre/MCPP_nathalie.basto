# carga librerias
library(tm)
library(wordcloud)

setwd("C:/Users/Nathalie/Desktop/Maestria Año 2016/MCPP/0-proyecto/txt - copia")

# lee el documento UTF-8 y lo convierte a ASCII
txt <- readLines("col_plan_bogota20122015.txt",encoding="UTF-8")
txt = iconv(txt, to="ASCII//TRANSLIT")

# construye un corpus
corpus <- Corpus(VectorSource(txt))

# lleva a minúsculas
d  <- tm_map(corpus, tolower)

# quita espacios en blanco
d  <- tm_map(d, stripWhitespace)

# remueve la puntuación
d <- tm_map(d, removePunctuation)

d <- tm_map(d, removeNumbers)


# carga mi archivo de palabras vacías personalizada y lo convierte a ASCII
sw <- readLines("vacias.txt",encoding="UTF-8")
sw = iconv(sw, to="ASCII//TRANSLIT")

# remueve palabras vacías genericas
d <- tm_map(d, removeWords, stopwords("spanish"))

# remueve palabras vacías personalizadas
d <- tm_map(d, removeWords, sw)

corpus_clean<-tm_map(d, PlainTextDocument)
# crea matriz de terminos
tdm <- TermDocumentMatrix(corpus_clean)



findFreqTerms(tdm, lowfreq=20)

d <- tm_map(d, removeWords, c("ano","anos","mes","meses","mil","millon","millones"))
d <- tm_map(d, PlainTextDocument)

tdm <- TermDocumentMatrix(d)

m <- as.matrix(tdm)

v <- sort(rowSums(m),decreasing=TRUE)

df <- data.frame(word = names(v),freq=v)

write.csv(df, paste0("BOGOTA.csv"))
wordcloud(df$word,df$freq,min.freq=4, random.order=FALSE)

findAssocs(d_dtm, "tic", 0.1)
findAssocs(tdm, "ciudad", 0.1)
findAssocs(tdm, "inteligente", 0.1)
h1 <- as.data.frame(findAssocs(tdm, "inteligente", 0.1))


tdm2 <- removeSparseTerms(tdm, sparse=0.18)
distMatrix <- drop
distMatrix <- dist(scale(tdm))
fit <- hclust(distMatrix, method="ward.D2")

docsdissim <- dist(as.matrix(tdm), method = "euclidean")





df2 <- drop
df2 <- as.data.frame(inspect(tdm))
df.scale <- scale(df2)
d2 <- dist(df.scale, method = "euclidean")
fit <- hclust(d2, method = "ward.D2")
plot (fit)



