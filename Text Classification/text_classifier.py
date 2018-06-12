# importing the librearies
import numpy as np
import re
import pickle
import nltk
from nltk.corpus import stopwords
from sklearn.datasets import load_files
nltk.download('stopwords')

# importing dataset
# reviews = load_files('txt_sentoken/')
# X,y = reviews.data, reviews.target

# # storing as pickle files
# with open('X.pickle', 'wb') as f:
#     pickle.dump(X,f)

# with open('y.pickle', 'wb') as f:
#     pickle.dump(y,f)
    
# unpickling dataset
with open('X.pickle', 'rb') as f:
    X = pickle.load(f)

with open('y.pickle', 'rb') as f:
    y = pickle.load(f)

# creating the corpus
corpus = []
for i in range(0,len(X)):
    review = re.sub(r'\W',' ',str(X[i]))
    review = review.lower()
    review = re.sub(r'\s+[a-z]\s+',' ',review)
    review = re.sub(r'^[a-z]\s+',' ',review)
    review = re.sub(r'\s+',' ',review)
    corpus.append(review)

for i in range(1,5):
    print(corpus[i])

# bag of words
# from sklearn.feature_extraction.text import CountVectorizer
# vectorizer = CountVectorizer(max_features=2000,min_df=3,max_df=0.6,stop_words=stopwords.words('english'))
# X = vectorizer.fit_transform(corpus).toarray()

# # BoW to TF-IDF
# from sklearn.feature_extraction.text import TfidfTransformer
# transformer = TfidfTransformer()
# X = transformer.fit_transform(X).toarray()

# TF-IDF Vectorizer
# so we don't need to countVectorizer and TfidfTransformer
from sklearn.feature_extraction.text import TfidfVectorizer
vectorizer = TfidfVectorizer(max_features=2000,min_df=3,max_df=0.6,stop_words=stopwords.words('english'))
X = vectorizer.fit_transform(corpus).toarray()

# creating training and test set
from sklearn.model_selection import train_test_split
text_train,text_test,sent_train,sent_test = train_test_split(X,y,test_size=0.2,random_state=0)

# train data with logistic regression
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression()
classifier.fit(text_train, sent_train)

# testing the model
sent_predict = classifier.predict(text_test)
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(sent_test,sent_predict)

# accuracy percentage
accuracy = (cm[0][0] + cm[1][1])/4
print(accuracy)

# save model
with open('classifier_lm.pickle','wb') as f:
    pickle.dump(classifier,f)

with open('tfidfmodel.pickle','wb') as f:
    pickle.dump(vectorizer,f)

# load the classifier and vectorizer from pickle file
with open('classifier.pickle','rb') as f:
    clf = pickle.load(f)

with open('tfidfmodel.pickle','rb') as f:
    tfidf = pickle.load(f)

# use the model
sample = ["You are a bad and nice person man, have a good life"]
sample = tfidf.transform(sample).toarray()
print(clf.predict(sample))    