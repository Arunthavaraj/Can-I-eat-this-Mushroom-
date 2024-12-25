# Can I Eat the Mushroom? - A Statistical Analysis Using Classifiers

Welcome to the **Can I Eat the Mushroom?** project! This machine learning classification model predicts whether a mushroom is edible or poisonous based on its features. The dataset used in this project is the famous 'mushroom dataset,' which includes key characteristics such as cap shape, cap surface, cap color, odor, and height.

## 🚀 **Project Overview**
The goal of this project is to use machine learning techniques to classify mushrooms as either edible or poisonous based on their features. By utilizing various classification algorithms, we aim to create an accurate and reliable model for mushroom identification.

### **Technologies and Techniques Used:**
1. **Decision Trees**: A supervised learning algorithm that partitions data based on feature values, creating a tree-like structure to make predictions.
2. **Random Forests**: An ensemble learning method that constructs multiple decision trees and averages their predictions to improve accuracy and avoid overfitting.
3. **C5.0 Algorithm**: A more advanced decision tree algorithm offering enhancements like faster performance, smaller trees, and additional features such as boosting and pruning.
4. **Hyperparameter Tuning**: Optimizing model parameters using grid search with 10-fold cross-validation, specifically tuning the `mtry` parameter in Random Forest to control the number of features considered at each split.

## 🔍 **System Design**
The project follows a systematic approach:
1. **Data Loading & Preprocessing**: Load and clean the mushroom dataset, ensuring all features are in the correct format.
2. **Model Development**: Implement and train Decision Tree, Random Forest, and C5.0 models.
3. **Hyperparameter Tuning**: Use grid search with cross-validation to tune the Random Forest model for optimal performance.
4. **Model Evaluation**: Evaluate models based on accuracy, sensitivity, and performance metrics.

## 📊 **Key Findings**
- **Important Features**: Features like odor, cap shape, cap surface, and cap color are crucial in predicting the edibility of mushrooms.
- **Best Model**: The **Random Forest** model, after hyperparameter tuning, achieved near-perfect accuracy of **99.22%**.
- **C5.0 Performance**: The **C5.0** algorithm showed high performance with **99.14%** accuracy and **100%** sensitivity, making it a strong contender for classification.

## 🏆 **Achievements**
- Developed high-performing machine learning models for mushroom edibility classification.
- Tuned models to achieve near-perfect accuracy.
- Provided clear and interpretable rules for classification based on mushroom features.

## ⚠️ **Limitations**
- The dataset is limited to mushrooms with specific features, which may not fully represent all possible mushroom varieties.
- Further enhancement can be made by testing with larger, more diverse datasets.

## 🔮 **Future Work**
- **Model Expansion**: Experiment with additional features and datasets to improve model generalization.
- **Real-Time Application**: Implement the model for real-time mushroom identification, integrating with mobile apps for safe mushroom foraging.

## 💡 **How to Use**
1. Clone the repository:  
   `git clone https://github.com/arunthavaraj/mushroom-classifier.git`
   
2. Install dependencies:  
   In R, run:  
   `install.packages(c("randomForest", "C50", "caret"))`
   
3. Run the analysis:  
   Execute the R script:  
   `Rscript mushroom_classifier.R`

4. Evaluate performance and tweak parameters for improved accuracy.

## 💬 **Contribute**
Feel free to fork this repository, make improvements, and create a pull request.

---

Thank you for checking out the project!
