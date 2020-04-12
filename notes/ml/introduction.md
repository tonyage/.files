# Types of Machine Learning

Branches of Machine Learning:

    * Supervised
    * Unsupervised
    * Reinforcement


## Supervised Learning

Machine learning algorimths learn from labled data. After studying the labled
data, these algorithms can lable new data based on the patterns they observed
from studying prior data. This branch of machine learning has gained the most
traction in uses cases across business applications.  Supervised learning can
be divided into two categories:
    
    * Classification
    * Regression

Deep learning can be used within supervised machine learning to create
techniques that are better at image recognition or identifying when a movie was
created based on the video footage.

### Classification

Classification models predict a category that an item belongs too. The
categories these models predict can be extended to predict any number of
categories. For example: a model that categorizes the gender of dogs, could be
extended to predict what breed the dog is.

### Regression

Alternatively regression algorithms predit numeric outcomes. Like home price or
a person's height.

## Unsupervised Learning

This method creates models for when there are no existing labels, on the data,
to train on. This branch of machine learning algorithms has been effective for
applications such as: music recommendations, grouping similar items and
reducing a data set to a fewer number of useful features.

## Reinforcement Learning

Used to train algorithms that learn based on taking certain actions and
receiving rewards for those actions. The applications of this branch of
learning are like self driving cars and game playing agents like go or chess.
This method is uncommon in data science applications.

# Deep Learning and Neural Networks

Deep learning has essentially beaten all other machine learning algorithms in
its ability to predict. It can be used for all times of machine learning.
Overtime we have cared less and less about how we make predictions and more
about the accuracy of those predictions.

In this space we rarely ever understand how or why our model makes their
predictions. This is a buzzword these days and we should be aware of some
limitations of deep learning, since it is not always applicable.

## Barriers to Deep Learning

1. You must have a lot of data
2. You must have a lot of compute power - in order to reach super human
   performance Google's DeepMind needed 1202 cpus and 176 gpus
3. You probably won't understand why certain decisions were made

## Machine Learning Libraries

TensorFlow and Scikit-learn are two of the most popular open-source libraries
in the word for machine learning. These libraries provide and would-be data
scientist the ability to use the most advanced techniques in supervised and
unsupervised machine learning easily, and for a variety ofsituations.  You can
expect that TensorFlow and Scikit-learn will continue to be used for machine
learning in both industry and academia for the forseeable future.

# Ethics in Machine Learning

Machine learning models have the power to surmize data efficiently and
intelligently, but unfortunately real world data always contains errors and
biases. As a consequence the ML models that study these data sets also contain
these errors and biases. The bias held my humans will transfer to computers as
long as humans are the creators of the data. It is important to keep in mind
your own biases when building any machine learning models. Real world
validation of your models are more important that statistical validation.
