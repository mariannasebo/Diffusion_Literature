library(bibliometrix)
#checking the file wos.txt
wos <- 
  convert2df("wos.txt")

#M1 <- convert2df(file = "wos.ciw", dbsource = "wos", format = "endnote") didnt work
#scopus
M1 <- convert2df(file = "scopus.bib", dbsource = "scopus", format = "bibtex")
#descriptive analysis of scopus
results <- biblioAnalysis(M, sep = ";")
options(width=100)
S <- summary(object = results, k = 10, pause = FALSE)
topAU <- authorProdOverTime(M1, k = 10, graph = TRUE)

NetMatrix <- biblioNetwork(M1, analysis = "co-occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 15, 
                Title ="Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=1.7)

# Create a historical citation network
options(width=130)
histResults <- histNetwork(M, min.citations = 1, sep = ";")
net <- histPlot(histResults, n=15, size = 10, labelsize=5)
