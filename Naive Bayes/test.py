import pickle
import glob
from functions import *

with open('poslogp.txt'+str(mode), 'rb') as f:
    px_pos_list = pickle.load(f)
with open('neglogp.txt'+str(mode), 'rb') as f:
    px_neg_list = pickle.load(f)

M = len(px_pos_list)
print M

print px_pos_list
print px_neg_list

# Calculate top 10 sentiment carrying words
top_10_pos_index = sorted(range(M),key = lambda x:px_pos_list[x])[-10:]
top_10_pos = []
for i in range(1,11):
    top_10_pos.append(dict_list[top_10_pos_index[-i]])

top_10_neg = []
top_10_neg_index = sorted(range(M),key = lambda x:px_neg_list[x])[-10:]
for i in range(1,11):
    top_10_neg.append(dict_list[top_10_neg_index[-i]])

#
pos_file_list = glob.glob('review_polarity/txt_sentoken/pos/*.txt')
train_pos_file_list = pos_file_list[0:N]
test_pos_file_list = pos_file_list[N:TotalN]

neg_file_list = glob.glob('review_polarity/txt_sentoken/neg/*.txt')
train_neg_file_list = neg_file_list[0:N]
test_neg_file_list = neg_file_list[N:TotalN]


# predict the result in the training set
pos_train_result = get_predict(train_pos_file_list, dict_list, px_pos_list, px_neg_list, N)
neg_train_result = get_predict(train_neg_file_list, dict_list, px_pos_list, px_neg_list, N)

# predict the result in the testing set
pos_predict_result = get_predict(test_pos_file_list, dict_list, px_pos_list, px_neg_list, TotalN-N)
neg_predict_result = get_predict(test_neg_file_list, dict_list, px_pos_list, px_neg_list, TotalN-N)

print pos_train_result
print pos_predict_result

print neg_train_result
print neg_predict_result



# Saving the objects:
with open('result.pickle'+str(mode), 'w') as f:
    pickle.dump([pos_train_result, pos_predict_result, neg_train_result,neg_predict_result], f)
with open('top_words.pickle'+str(mode), 'w') as f:
    pickle.dump([top_10_pos,top_10_neg], f)









