Karma-Logistic-Regression-Service
===========================

A RESTful service for Logistic Regression.

### Setting up the service

* Compile and create WAR file:

    + Open Terminal and go to *logit-service* folder
    + Run *mvn clean package*
    

* Copy the WAR file from *logit-service/target/* to *webapps* folder of Tomcat
* Start the Tomcat server

### Running the service
    
* To train and create a Decision Tree model:

    + Send a POST request with payload as contents of the training data in CSV format to

        http://**host-name**:**port**/logit-service/api/logit/train

    + By default, the last column is assumed to contain the class labels
    + To specify column-number of class labels, add *classColumnNumber* parameter:

        http://**host-name**:**port**/logit-service/api/logit/train?classColumnNumber=**column-number**

    + The response will contain a summary of the training phase and the name of the created model at its bottom
    + Note down the model name (which starts with 'Logit' and ends with 'model')

* To test a model:

    + Send a POST request with payload as contents of the testing data in CSV format to

        http://**host-name**:**port**/logit-service/api/logit/test?modelName=**model-name**

    + To specify column-number of class labels, add *classColumnNumber* parameter:

        http://**host-name**:**port**/logit-service/api/logit/test?modelName=**model-name**&classColumnNumber=**column-number**

    + By default, the output of the testing phase is a confusion matrix
    + To specify the output type of the testing phase, add *outputType* parameter:

        - http://**host-name**:**port**/logit-service/api/logit/test?modelName=**model-name**&outputType=confusion_matrix
        - http://**host-name**:**port**/logit-service/api/logit/test?modelName=**model-name**&outputType=predictions