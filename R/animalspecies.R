#' @title animalspecies
#'
#' @description This package gives data for any animal in South Africa
#'
#' @param symbolS
#'
#' @format A data frame with columns:
#' \describe{
#'  \item{Number}{A number from from 1 to 108}
#'  \item{Animal}{Animal name.}
#'  \item{Category}{Regions: Coast, Forest, Fynbos, Nama Karoo, Ocean, Savanna, Succulent Karoo, Thicket, Wetland}
#'  \item{Species}{Species: Amphibian, Bird, Crustacean, Fish, Insect, Mammal, Reptile.}
#'  \item{Age}{Maximum age between 0.05 and 100 years.}
#'  \item{Weight}{Weight between 0.00001 and 80000.}
#'  \item{Size}{A value between 0.3 and 1800.}
#'  \item{Speed}{A value between 0.5 and 160 kilometers per hour.}
#'  \item{Vulnerability}{An integer from 1 to 4 where 1 is very vulnerable.}
#' }
#'
#'
#' @return NULL
#'
#' @examples  animal_spec('Impala','Mammal')
#'
#' @export animal_spec

animal_spec<-function(animalname, specie)
{
  library(tidyverse)
  superanimals <-  read_csv("C:/DOCS/animalspecies/data/superanimals.csv")
  #system.file("extdata", "superanimals.csv", package = "animalspecies",  mustWork = TRUE)
  animal <- list(superanimals$Animal)
  descrip <- subset(superanimals,superanimals$Animal == animalname)
  #print("List of all the animals")
  #print(animal)
  print(paste0("The statistics for the requested animal:", animalname))
  print(descrip)
  chosen_specie <- subset(superanimals,superanimals$Species == specie)

  print(paste0("A plot for size and speed for the specie: ", specie ))
  graphics.off()
  par("mar")
  par(mar=c(1,1,1,1))
  plot(chosen_specie$Size,chosen_specie$Speed)
}

