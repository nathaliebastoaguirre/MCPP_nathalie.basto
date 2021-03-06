library(tm)
library(wordcloud)

setwd("C:/Users/Nathalie/Desktop/Maestria A�o 2016/MCPP/0-proyecto/txt - copia")

(d <- Corpus(DirSource(pattern = "col_plan_",
                         encoding = "UTF-8"),
               readerControl = list(language = "es",
                                    reader = readPlain,
                                    load = TRUE)))

# quita espacios en blanco
d  <- tm_map(d, stripWhitespace)



# lleva a min�sculas
d  <- tm_map(d, tolower)


for (j in 1:length(d)) d[[j]] <-gsub("<f3>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<d3>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<ed>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<cd>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<fa>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<c1>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<e1>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<fa>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<>","�", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("<e9>","�", d[[j]])


# remueve la puntuaci�n
d <- tm_map(d, removePunctuation)

d <- tm_map(d, removeNumbers)



for (j in 1:length(d)) d[[j]] <-gsub("ciudad sostenible","ciudad_sostenible", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciudad inteligente","cuidad_inteligente", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciudad digital","ciudad_digital", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("investigaci�n y desarrollo","iyd", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("investigaci�n desarrollo","iyd", d[[j]])




for (j in 1:length(d)) d[[j]] <-gsub("tics","tic", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovadora","innovador", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("innovaci�n","innovador", d[[j]])
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
for (j in 1:length(d)) d[[j]] <-gsub("digitalizaci�n","digital", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("ciencias","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("cient�fica","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("cient�ficas","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("cient�fico","ciencia", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("cient�ficos","ciencia", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("tecnol�gica","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnolog�as","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnologia","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnol�gicas","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnol�gico","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnol�gicos","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnificaci�n","tecnolog�a", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("tecnolog�as","tecnolog�a", d[[j]])

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
for (j in 1:length(d)) d[[j]] <-gsub("interconexi�n","interconectado", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("interconexiones","interconectado", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("productiva","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productivos","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productivo","productividad", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("productividads","productividad", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("sostenibles","sostenible", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("sostenibilidad","sostenible", d[[j]])

for (j in 1:length(d)) d[[j]] <-gsub("optimizaci�n","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizado","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizados","optimizar", d[[j]])
for (j in 1:length(d)) d[[j]] <-gsub("optimizando","optimizar", d[[j]])




#aca deben ir las palabras que se van a sustituir con loops tales como:

#for (j in 1:length(d)) d[[j]] <- gsub("anual", "a�o", d[[j]])

# carga mi archivo de palabras vac�as personalizada y lo convierte a ASCII
sw <- readLines("vacias.txt",encoding="UTF-8")
sw = iconv(sw, to="ASCII//TRANSLIT")

# remueve palabras vac�as genericas
d <- tm_map(d, removeWords, stopwords("spanish"))

# remueve palabras vac�as personalizadas
d <- tm_map(d, removeWords, sw)


h<-tm_map(d, PlainTextDocument)


d_dtm <- DocumentTermMatrix(h)
#FORM DOCUMENT TERM MATRIX
#ASSEMBLES A MATRIX WITH TERMS IN COLUMNS AND DOCUMENTS IN ROWS 

d_dtm <- as.data.frame(inspect(d_dtm))
#TRANSFORM TO DATA FRAME

write.table(d_dtm, col.names = NA, quote = FALSE, sep = "\t", file = "C:/Users/Nathalie/Desktop/Maestria A�o 2016/MCPP/0-proyecto/txt - copia/d_dtm.txt")
#EXPORT

d_dtm <- TermDocumentMatrix(h)
d.dtm <- as.data.frame(inspect(d_dtm))
write.table(d.dtm, col.names = NA, quote = FALSE, sep = "\t", file = "C:/Users/Nathalie/Desktop/Maestria A�o 2016/MCPP/0-proyecto/txt - copia/d_dtm1.txt")
















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
