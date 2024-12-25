# Load necessary libraries
library(tidyverse)
library(gridExtra)
library(ggplot2)
library(caret)

# Load the dataset
mushrooms <- read.csv("mushrooms.csv")

# Display the structure and summary of the dataset
print(str(mushrooms))
print(summary(mushrooms))

# Check for missing values
missing_values <- sapply(mushrooms, function(x) sum(is.na(x)))
print(missing_values)

# Display the first few rows of the dataset
print(head(mushrooms))

# Plot distribution of each variable
p1 <- ggplot(mushrooms, aes(x = Edible)) + geom_bar() + ggtitle('Distribution of Edible')
p2 <- ggplot(mushrooms, aes(x = CapShape)) + geom_bar() + ggtitle('Distribution of CapShape')
p3 <- ggplot(mushrooms, aes(x = CapSurface)) + geom_bar() + ggtitle('Distribution of CapSurface')
p4 <- ggplot(mushrooms, aes(x = CapColor)) + geom_bar() + ggtitle('Distribution of CapColor')
p5 <- ggplot(mushrooms, aes(x = Odor)) + geom_bar() + ggtitle('Distribution of Odor')
p6 <- ggplot(mushrooms, aes(x = Height)) + geom_bar() + ggtitle('Distribution of Height')

# Arrange plots in a grid
grid.arrange(p1, p2, p3, p4, p5, p6)

# Frequency distribution of each variable
freq_edible <- table(mushrooms$Edible)
freq_capshape <- table(mushrooms$CapShape)
freq_capsurface <- table(mushrooms$CapSurface)
freq_capcolor <- table(mushrooms$CapColor)
freq_odor <- table(mushrooms$Odor)
freq_height <- table(mushrooms$Height)

# Cross-tabulation between Edible and other variables
cross_tab_capshape <- table(mushrooms$Edible, mushrooms$CapShape)
cross_tab_capsurface <- table(mushrooms$Edible, mushrooms$CapSurface)
cross_tab_capcolor <- table(mushrooms$Edible, mushrooms$CapColor)
cross_tab_odor <- table(mushrooms$Edible, mushrooms$Odor)
cross_tab_height <- table(mushrooms$Edible, mushrooms$Height)

# Print the frequency distributions
print(freq_edible)
print(freq_capshape)
print(freq_capsurface)
print(freq_capcolor)
print(freq_odor)
print(freq_height)

# Print the cross-tabulations
print(cross_tab_capshape)
print(cross_tab_capsurface)
print(cross_tab_capcolor)
print(cross_tab_odor)
print(cross_tab_height)

# Further Analysis

# 1. Correlation analysis using Chi-squared test
chi_squared_tests <- list(
  CapShape = chisq.test(mushrooms$Edible, mushrooms$CapShape),
  CapSurface = chisq.test(mushrooms$Edible, mushrooms$CapSurface),
  CapColor = chisq.test(mushrooms$Edible, mushrooms$CapColor),
  Odor = chisq.test(mushrooms$Edible, mushrooms$Odor),
  Height = chisq.test(mushrooms$Edible, mushrooms$Height)
)

# Print Chi-squared test results
print(chi_squared_tests)

# 2. Visualize relationships using mosaic plots
mosaicplot(~ Edible + CapShape, data = mushrooms, main = "Edible vs CapShape")
mosaicplot(~ Edible + CapSurface, data = mushrooms, main = "Edible vs CapSurface")
mosaicplot(~ Edible + CapColor, data = mushrooms, main = "Edible vs CapColor")
mosaicplot(~ Edible + Odor, data = mushrooms, main = "Edible vs Odor")
mosaicplot(~ Edible + Height, data = mushrooms, main = "Edible vs Height")

# 3. Feature Engineering
# Create a new feature combining CapShape and CapColor
mushrooms$CapShape_Color <- paste(mushrooms$CapShape, mushrooms$CapColor, sep = "_")

# 4. Prepare data for modeling
# Convert categorical variables to factors
mushrooms <- mushrooms %>%
  mutate(across(where(is.character), as.factor))

# Split the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(mushrooms$Edible, p = 0.7, list = FALSE)
trainData <- mushrooms[trainIndex, ]
testData <- mushrooms[-trainIndex, ]

# 5. Build a predictive model using Decision Trees
model <- train(Edible ~ ., data = trainData, method = "rpart")

# Predict on the test data
predictions <- predict(model, testData)

# Evaluate the model
conf_matrix <- confusionMatrix(predictions, testData$Edible)
print(conf_matrix)

# Plot the decision tree
rpart.plot::rpart.plot(model$finalModel, main = "Decision Tree for Edibility Prediction")

# Save the enhanced dataset to a new CSV file
write.csv(mushrooms, "enhanced_mushrooms.csv", row.names = FALSE)
