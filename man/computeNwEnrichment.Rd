% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/computeNwEnrichment.R
\name{computeNwEnrichment}
\alias{computeNwEnrichment}
\title{Perform enrichment analysis on the input network}
\usage{
computeNwEnrichment(edgelist, nodelist, annotation, pval, fc, pcol, internalid, method, size, hasatt)
}
\arguments{
\item{edgelist}{a data frame of edges contains at least a source column (1st column) and a target column (2nd column).}

\item{nodelist}{a data frame of nodes contains at least two columns of node attributes.
1st column is id or neo4j id, 2nd column is id or grinn id. The 2nd column is used for Mesh annotation.}

\item{annotation}{a string specifying the annotation type e.g. pathway (default) and mesh. Pathway annotation requires the database.
Mesh annotation doesn't require the database but it is available for PubChem compounds only.}

\item{pval}{a numeric vector or a two-column data frame of statistical values e.g. p-values.
If \code{pval} is a vector, the name attributes must be identical to the names of network nodes.
If \code{pval} is a data frame, 1st column contains the network nodes and 2nd column contains statistical values.}

\item{fc}{a numeric vector of fold changes or sign information (positive or negative) with name attributes identical to the names of entities. Default is NULL.}

\item{pcol}{a string specifying columnname containing p-values. This parameter is only for accepting the input from GUI.}

\item{internalid}{a logical value indicating whether the network nodes are neo4j ids, if TRUE (default). If not, the network nodes are expected to be any ids.
See details and see \code{\link{convertId}} for how to convert ids. It has no effect on Mesh annotation.}

\item{method}{a string specifying the enrichment analysis method. It can be one of reporter (default), fisher, median, mean, stouffer. See \code{\link{runGSA}}}

\item{size}{a numeric vector specifying the minimum and maximum number of members in each annotation term to be used in the analysis. Default is c(3,500).}

\item{hasatt}{a logical value indicating whether node attributes are kept already. Used by GUI.}
}
\value{
list of data frame of nodes, edges, enrichment and pairs. The pairs data frame contains annotation pairs. The data frame of enrichment contains the following components:

\code{rank} = rank sort by p

\code{id} = annotation id or annotation neo4j id

\code{gid} = annotation id or annotation grinn id

\code{nodename} = annotation name

\code{nodelabel} = annotation type

\code{nodexref} = cross references

\code{p} = raw p-values

\code{p_adj} = adjusted p-values

\code{no_of_entities} = number of input entities in each annotation term

\code{annotation_size} = total number of entities in each annotation term from the database

\code{member} = list of entity members of the annotation term

Return list of empty data frame if error or found nothing.
}
\details{
The database uses two id systems. The neo4j id is a numeric, internal id automatically generated by the database system.
The grinn id (gid) is an id system of Grinn database that uses main ids of standard resources
i.e. ENSEMBL for genes (e.g.ENSG00000139618), UniProt for proteins (e.g.P0C9J6), PubChem CID for compounds (e.g.5793), KEGG for pathways (e.g.hsa00010).
}
\examples{
# Compute enriched Mesh terms of the input network
#simnw <- computeSimilarity(c(1110,10413,196,51,311,43,764,790)) #compute similarity network for given pubchem compounds
#pval <- data.frame(pubchem=c(1110,10413,196,51,311,43,764,790), stat=runif(8, 0, 0.06)) #statistical values of pubchem compounds
#result <- computeNwEnrichment(simnw$edges, simnw$nodes, annotation="mesh", pval, internalid = FALSE)
# Compute enriched pathways of the input network (example for mouse database only!)
#prt = c(217389,268332,268655,328500,335545, 282124, 266645, 356549, 269007, 284429, 334878)
#cmp = c(0, 2, 1, 49180, 11429, 1774, 43936)
#bionw <- fetchHetNetwork(from=prt, to=cmp, pattern="(from:Protein)-[:CATALYSIS]->(to:Compound)")
#pval <- data.frame(nid=c(0, 2, 1, 49180, 11429, 1774, 43936,217389,268332,268655,328500,335545, 282124, 266645, 356549, 269007, 284429, 334878), stat=runif(18, 0, 0.06))
#result <- computeNwEnrichment(bionw$edges, bionw$nodes, annotation="pathway", pval, size=c(1,100))
}
\author{
Kwanjeera W \email{kwanich@ucdavis.edu}
}
\references{
Fisher R. (1932) Statistical methods for research workers. Oliver and Boyd, Edinburgh.

Stouffer S., Suchman E., Devinney L., Star S., and Williams R. (1949) The American soldier: adjustment during army life. Princeton University Press, Oxford, England.

Patil K. and Nielsen J. (2005) Uncovering transcriptional regulation of metabolism by using metabolic network topology. Proceedings of the National Academy of Sciences of the United States of America 102(8), 2685.

Oliveira A., Patil K., and Nielsen J. (2008) Architecture of transcriptional regulatory circuits is knitted over the topology of bio-molecular interaction networks. BMC Systems Biology 2(1), 17.

Väremo L., Nielsen J., and Nookaew I. (2013) Enriching the gene set analysis of genome-wide data by incorporating directionality of gene expression and combining statistical hypotheses and methods. Nucleic Acids Research, 41(8), pp. 4378-4391.
}
\seealso{
\code{\link{loadGSC}}, \code{\link{runGSA}}, \code{\link{GSAsummaryTable}}
}

