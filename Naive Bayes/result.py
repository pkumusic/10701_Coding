# Getting back the objects:
from functions import M,mode
N = 800
T = 200
import pickle
with open('result.pickle'+str(mode)) as f:
    pos_train_result, pos_predict_result, neg_train_result,neg_predict_result = pickle.load(f)

print len(pos_train_result),len(pos_predict_result)

with open('top_words.pickle'+str(mode)) as f:
    top_10_pos,top_10_neg = pickle.load(f)

train_accuracy = float((pos_train_result.count(1) + neg_train_result.count(0)))/(2*N)
test_accuracy = float((pos_predict_result.count(1) + neg_predict_result.count(0)))/(2*T)

print 'Size of Vocabulary:', M
print 'Train Accuracy:',train_accuracy
print 'Test Accuracy:',test_accuracy
print 'Top 10 Positive words:', top_10_pos
print 'Top 10 Negative words:', top_10_neg