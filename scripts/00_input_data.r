#read in dataset
cell = read.csv("whiteBloodCellDataset.csv", header = TRUE)

#view data
View(cell)
head(cell)

#Eliminate outliers

cell = cell[-87,]
cell = cell[-288,]
cell = cell[-483,]