import tweepy
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import re
import pickle
import pymysql.cursors

consumer_key = 'bVQ5q2dG72dlEicthv6zCaU8B'
consumer_secret = 'DKcOptyFqRNeRXEU2zycjOAdxMRVWr28MfbjNsCYAIlarY4pVm'
access_token = '970426124512632832-I4xlYipBghLUAu6tGbZqNgL8zWrwxD6'
access_secret = 'E4jbd80Exh9il5n4nYcpSxNoUmJgc3fuW61ADNF36Sxgb'

auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
api = tweepy.API(auth, timeout=10)

# mysql connection
conn = pymysql.connect(host="localhost",
                       user="root",
                       passwd="rootroot",
                       db="python")
x = conn.cursor()

# open the model
with open('tfidfmodel.pickle', 'rb') as f:
    vectorizer = pickle.load(f)

with open('classifier_svm.pickle', 'rb') as f:
    clf = pickle.load(f)


# override tweepy.StreamListener
class MyStreamListener(tweepy.StreamListener):

    def on_status(self, status):
        if 'RT @' not in status.text:
            tweet = self.preprocess(status.text)
            # print(status.text, " : ", self.predict(tweet))
            try:
                x.execute("""INSERT INTO tweets(text, date, sentiment) VALUES (%s,%s,%s)""",
                          (status.text, str(status.created_at), int(self.predict(tweet))))
                conn.commit()
            except:
                conn.rollback()

    def on_error(self, status_code):
        if status_code == 420:
            # returning False in on_data disconnects the stream
            return False

    def preprocess(self, tweet):
        tweet = re.sub(r"^https://t.co/[a-zA-Z0-9]*\s", " ", tweet)
        tweet = re.sub(r"\s+https://t.co/[a-zA-Z0-9]*\s", " ", tweet)
        tweet = re.sub(r"\s+https://t.co/[a-zA-Z0-9]*\s", " ", tweet)
        tweet = tweet.lower()
        tweet = re.sub(r"that's", "that is", tweet)
        tweet = re.sub(r"there's", "there is", tweet)
        tweet = re.sub(r"what's", "what is", tweet)
        tweet = re.sub(r"where's", "where is", tweet)
        tweet = re.sub(r"it's", "it is", tweet)
        tweet = re.sub(r"who's", "who is", tweet)
        tweet = re.sub(r"i'm", "i am", tweet)
        tweet = re.sub(r"she's", "she is", tweet)
        tweet = re.sub(r"he's", "he is", tweet)
        tweet = re.sub(r"they're", "they are", tweet)
        tweet = re.sub(r"who're", "who are", tweet)
        tweet = re.sub(r"ain't", "am not", tweet)
        tweet = re.sub(r"wouldn't", "would not", tweet)
        tweet = re.sub(r"shouldn't", "should not", tweet)
        tweet = re.sub(r"can't", "can not", tweet)
        tweet = re.sub(r"couldn't", "could not", tweet)
        tweet = re.sub(r"won't", "will not", tweet)
        tweet = re.sub(r"\W", " ", tweet)
        tweet = re.sub(r"\d", " ", tweet)
        tweet = re.sub(r"s+[a-z]\s", " ", tweet)
        tweet = re.sub(r"\s+[a-z]$", " ", tweet)
        tweet = re.sub(r"^[a-z]\s+", " ", tweet)
        tweet = re.sub(r"\s+", " ", tweet)
        return tweet

    def predict(self, tweet):
        return clf.predict(vectorizer.transform([tweet]).toarray())


myStreamListener = MyStreamListener()
myStream = tweepy.Stream(auth=api.auth, listener=myStreamListener)

myStream.filter(track=['workout', 'running'], async=True)
myStream.filter(locations=[-73.9857679522,40.7623129194,-73.9449816737,40.8019975756])
conn.close()
