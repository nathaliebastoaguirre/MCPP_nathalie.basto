library(tm)
library(wordcloud)

setwd("C:/Users/Nathalie/Desktop/Maestria Año 2016/MCPP/0-proyecto/txt - copia")

(d <- Corpus(DirSource(pattern = "col_plan_",
                         encoding = "UTF-8"),
               readerControl = list(language = "es",
                                    reader = readPlain,
                                    load = TRUE)))

# quita espacios en blanco
d  <- tm_map(d, stripWhitespace)



# lleva a minúsculas
d  <- tm_map(d, tolower)


for (j in 1:length(d)) d[[j]] <-gsub("<f3>","ó", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<d3>","ó", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<ed>","í", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<cd>","í", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<fa>","í", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<c1>","á", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<e1>","á", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<fa>","ú", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<>","ú", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<e9>","é", d[[j]])


# remueve la puntuación
d <- tm_map(d, removePunctuation)

d <- tm_map(d, removeNumbers)



for (j in 1:length(d)) d[[j]] <-gsub("ciudad sostenible","ciudad_sostenible", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciudad inteligente","cuidad_inteligente", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciudad digital","ciudad_digital", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("investigación y desarrollo","iyd", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("investigación desarrollo","iyd", d[[j]])




for (j in 1:length(d)) d[[j]] <-gsub("tics","tic", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovadora","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovación","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovaciones","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovadores","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovar","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovadoren","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovadors","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovando","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovation","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("inteligentes","inteligente", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("inteligencia","inteligente", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("digitales","digital", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("digitalización","digital", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciencias","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("científica","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("científicas","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("científico","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("científicos","ciencia", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("tecnológica","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnologías","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnologia","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnológicas","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnológico","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnológicos","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnificación","tecnología", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnologías","tecnología", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("sostenibles","sostenible", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("conectarse","conectar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("conectividad","conectar", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("competitiva","competitividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("competitivas","competitividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("competitivo","competitividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("competitivos","competitividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("competitividads","competitividad", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("computadores","computador", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("interconectada","interconectado", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("interconectados","interconectado", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("interconectividad","interconectado", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("interconexión","interconectado", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("interconexiones","interconectado", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("productiva","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productivos","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productivo","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productividads","productividad", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("sostenibles","sostenible", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("sostenibilidad","sostenible", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("optimización","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizado","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizados","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizando","optimizar", d[[j]])




#aca deben ir las palabras que se van a sustituir con loops tales como:

#for (j in 1:length(d)) d[[j]] <- gsub("anual", "año", d[[j]])

# carga mi archivo de palabras vacías personalizada y lo convierte a ASCII
sw <- readLines("vacias.txt",encoding="UTF-8")
sw = iconv(sw, to="ASCII//TRANSLIT")

# remueve palabras vacías genericas
d <- tm_map(d, removeWords, stopwords("spanish"))

# remueve palabras vacías personalizadas
d <- tm_map(d, removeWords, sw)


h<-tm_map(d, PlainTextDocument)


d_dtm <- DocumentTermMatrix(h)
#FORM DOCUMENT TERM MATRIX
#ASSEMBLES A MATRIX WITH TERMS IN COLUMNS AND DOCUMENTS IN ROWS 

d_dtm <- as.data.frame(inspect(d_dtm))
#TRANSFORM TO DATA FRAME

write.table(d_dtm, col.names = NA, quote = FALSE, sep = "\t", file = "C:/Users/Nathalie/Desktop/Maestria Año 2016/MCPP/0-proyecto/txt - copia/d_dtm.txt")
#EXPORT

d_dtm <- TermDocumentMatrix(h)
d.dtm <- as.data.frame(inspect(d_dtm))
write.table(d.dtm, col.names = NA, quote = FALSE, sep = "\t", file = "C:/Users/Nathalie/Desktop/Maestria Año 2016/MCPP/0-proyecto/txt - copia/d_dtm1.txt")
















h<-tm_map(d, PlainTextDocument)
# crea matriz de terminos
tdm <- TermDocumentMatrix(corpus_clean)



findFreqTerms(tdm, lowfreq=20)

d <- tm_map(d, removeWords, c("ano","anos","mes","meses","mil","millon","millones"))
d <- tm_map(d, PlainTextDocument)

tdm <- TermDocumentMatrix(d)

m <- as.matrix(tdm)

v <- sort(rowSums(m),decreasing=TRUE)

df <- data.frame(word = names(v),freq=v)

write.csv(df, paste0("MEDELLIN.csv"))
wordcloud(df$word,df$freq,min.freq=4, random.order=FALSE)
