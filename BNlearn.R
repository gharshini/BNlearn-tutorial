#Harshini
#performing bayesian in R


library(bnlearn)
library(igraph)

#creating hill climb model

dag = model2network("[A][S][E|A:S][O|E][R|E][T|O:R]")

arc.set = matrix(c("A", "E",
                   "S", "E",
                   "E", "O",
                   "E", "R",
                   "O", "T",
                   "R", "T"),
                 byrow = TRUE, ncol = 2,
                 dimnames = list(NULL, c("from", "to")))
dag = empty.graph(c("A", "S", "E", "O", "R", "T"))
arcs(dag) = arc.set
graphviz.plot(dag,shape = "ellipse")
dag$nodes


#Reading the gene expression data
#Rows are genes. expression values are columns
exprMatRaw=read.csv("C:/Users/harsh/Desktop/205/FLT_PCA.csv",row.names = 1,header = T)

##performing hill climb algorithm for the transpose of gene expression data given
dag = hc(data.frame(t(exprMatRaw)))


#You can save the edgelist
write.csv(dag$arcs,"C:/Users/harsh/Desktop/205/FLT_GRN.csv")
dag$nodes

#plot(dag)

#instead, visualize the network using Rgraphviz package
library(Rgraphviz)
graphviz.plot(dag,layout="dot",shape = "ellipse")




