import tweepy
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import re
import pickle
import pymysql.cursors

consumer_key = 'XbVQ5q2dG72dlEicthv6zCaU8B'
consumer_secret = 'DKcOptyFqRNeRXEU2zycjOAdxMRVWr28MfbjNsCYAIlarY4pVmX'
access_token = 'X970426124512632832-I4xlYipBghLUAu6tGbZqNgL8zWrwxD6'
access_secret = 'E4jbd80Exh9il5n4nYcpSxNoUmJgc3fuW61ADNF36SxgbX'

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

parkname = 'Central Park'
location = [-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]
keywords = {'workout': ['workout', 'running', 'walking', 'run', 'parkrun', 'jog', 'jogging', 'walk', 'walking', 'ride',
                        'cycling'],
            'socializing': ['relax', 'relaxing', 'meditation', 'reading', 'lunch', 'chill', 'mindfulness', 'yoga'],
            'relaxation': ['meetup', 'wedding', 'bbq', 'picnic', 'catchup', 'friends', 'festival', 'hangout', 'party',
                           'birthday']}


# override tweepy.StreamListener
class MyStreamListener(tweepy.StreamListener):

    def on_status(self, status):
        if 'RT @' not in status.text:
            tweet = self.preprocess(status.text)
            keyword = self.check_keyword(tweet)
            if keyword:
                print(status.text, " : ", self.predict(tweet))
                print(tweet, " : ", self.predict(tweet))
                print('=================================================')
                print(keyword)
                try:
                    x.execute(
                        """INSERT INTO tweets(text, date, sentiment, parkname, location, keyword)
                              VALUES (%s,%s,%s,%s,%s,%s)""",
                        (tweet, str(status.created_at), int(self.predict(tweet)), parkname, str(location), keyword))
                    conn.commit()
                except:
                    conn.rollback()

    def on_error(self, status_code):
        if status_code == 420:
            return False


    def preprocess(self, tweet):
        tweet = re.sub(r"^https://t.co/[a-zA-Z0-9]*\s", " ", tweet)
        tweet = re.sub(r"\s+https://t.co/[a-zA-Z0-9]*\s", " ", tweet)
        tweet = re.sub(r"http\S+", " ", tweet)
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
        tweet = re.sub(r"\s+[a-z]\s", " ", tweet)
        tweet = re.sub(r"\s+[a-z]$", " ", tweet)
        tweet = re.sub(r"^[a-z]\s+", " ", tweet)
        tweet = re.sub(r"\s+", " ", tweet)
        return tweet

    def predict(self, tweet):
        return clf.predict(vectorizer.transform([tweet]).toarray())

    def check_keyword(self, tweet):
        for word in tweet.split():
            for key, value in keywords.items():
                if word in value:
                    return key


myStreamListener = MyStreamListener()
myStream = tweepy.Stream(auth=api.auth, listener=myStreamListener)
myStream.filter(locations=location,
                async=True,
                languages=["en"])

# conn.close()
