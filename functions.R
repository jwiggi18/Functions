# home to all the functions I am working on

#for History of Earth
#get paleo latitude and longitude from PBDB
GetLatLong <- function(taxon,minage,maxage){
  pbdb_data <- read.csv(paste0("http://paleobiodb.org/",
    "data1.2/occs/list.txt?base_name=",taxon,
    "&min_ma=",minage,"&max_ma=",maxage,"&level=3&show=paleoloc"),
    stringsAsFactors = FALSE)
  lat_long <- data.frame(pbdb_data$accepted_name, pbdb_data$paleolng, pbdb_data$paleolat) #narrow to just name, lat, and long
  return(lat_long)
}

#' function to produce a dataframe from a user supplied taxon list with latitude and longitude coordinates and accepted name from paleobiodb along with the minimum age and maximum age of the taxon fossil. Ages follow the current official geologic timescale of teh International Commission on Stratigraphy.
#'@param taxa a character vector of taxon names
#'@return a data frame with column names: pbdb_data.accepted_name, pbdb_data.paleolng, pbdb_data.paleolat, taxon, minage, maxage, midage. "taxon" is the user-supplied taxon name.
#'@export
latlong_age <- function(taxa){
  Period <- c("Cambrian","Ordivician","Sularian","Devonian","Carboniferous","Permian","Triassic","Jurassic","Cretacous","Paleogene","Neo","Quaternary")

  MinMa <- c(485,444,419,359,299,252,201,145,65,23,2.58, 0)

  MaxMa <- c(541,485,444,419,359,299,252,201,145,65,23,2.58)

  MidMa <- c(513,464,431,389,328,278,226,173,105,44,12, 1)

  geoage <- data.frame(Period, MinMa, MaxMa)

  #store pbdb_data.accepted_name, pbdb_data.lng, pbdb_data.lat, taxon, minage, & maxage in a data frame
  lat_long_df <- data.frame()

  for (taxon_index in seq_along(taxa)) {
      for (period_index in seq_along(Period)) {
            latlong.result <- GetLatLong(taxa[taxon_index], minage=MinMa[period_index], maxage=MaxMa[period_index])
            latlong.result$taxon=taxa[taxon_index]
            latlong.result$minage=MinMa[period_index]
            latlong.result$maxage=MaxMa[period_index]
            lat_long_df<- rbind(lat_long_df, latlong.result)
          }
        }
  return(lat_long_df)
}


#' function to subset a dataframe by Ma
#'@param df a dataframe to be subset containing columns 'minage' and 'maxage' with associated data
#'@param minage a numerical vector of length one indicating that entries must be at least (>=) this old to be returned
#'@param maxage a numerical vector of length one indicating that entires must be at most (<=) this old to be returned
#'@return a data frame of entries subset by the user supplied minage and maxage
#'@export
subset_ma <- function(df, minage, maxage){
  df <- df[complete.cases(df),]
  age_latlong <- df[which(df$minage >= minage & df$maxage <= maxage), ]
  return(age_latlong)
}

#' function to subset a dataframe by taxon name
#'@param df a dataframe to be subset containing columns 'taxon'
#'@param taxon a character vector of length one indicating the taxon name by which to filter
#'@return a data frame of entries subset by the user supplied taxon name
#'@export
subset_taxon <- function(df, taxon){
  df <- df[complete.cases(df),]
  taxon_latlong <- df[which(df$taxon == taxon), ]
  return(taxon_latlong)
}


#' function to add pbdb paleo data points (lat and long) to gplatesr created maps
#'@param map a map created using gplatesr plot_gplates or black_white functions
#'@param df a data frame containing pbdb_data.paleolng and pbdb_data.paleolat
#'@param ptcolor a character vector indicating the desired color of added data points
add_points <- function(map, df, ptcolor) {
  map + geom_point(data = df, aes(x=pbdb_data.paleolng, y=pbdb_data.paleolat), color = ptcolor)
}


#for plotting a "balanced" tree
amb <- function (phy) #ambidextrous tree
{
    foo <- function(node, END, where) {
        right <-  (node%%2==0) # new line
        start <- which(phy$edge[, 1] == node)
        end <- c(start[-1] - 1, END)
        size <- end - start + 1
        desc <- phy$edge[start, 2]
        Nclade <- length(desc)
        n <- N[desc]
        o <- order(n, decreasing = right)
        newpos <- c(0, cumsum(size[o][-Nclade])) + where
        desc <- desc[o]
        end <- end[o]
        start <- start[o]
        neworder[newpos] <<- start
        for (i in 1:Nclade) if (desc[i] > nb.tip)
            foo(desc[i], end[i], newpos[i] + 1)
    }
    phy <- reorder(phy)
    nb.tip <- length(phy$tip.label)
    nb.node <- phy$Nnode
    nb.edge <- dim(phy$edge)[1]
    tmp <- reorder(phy, "postorder")
    N <- .C(node_depth, as.integer(nb.tip), as.integer(tmp$edge[,
                                                                1]), as.integer(tmp$edge[, 2]), as.integer(nb.edge),
            double(nb.tip + nb.node), 1L)[[5]]
    neworder <- integer(nb.edge)
    foo(nb.tip + 1, nb.edge, 1)
    phy$edge <- phy$edge[neworder, ]
    if (!is.null(phy$edge.length))
        phy$edge.length <- phy$edge.length[neworder]
    phy
}
