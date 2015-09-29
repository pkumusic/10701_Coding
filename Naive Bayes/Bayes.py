import pickle
from functions import *
import glob
from math import log

#print dict_list

#load the training data and create a list of review_feature
#pos: review_polarity/txt_sentoken/neg/cv000_29416.txt - cv799
#neg: review_polarity/txt_sentoken/pos/cv000_29590.txt - cv799
pos_review_list = []
neg_review_list = []
pos_file_list = glob.glob('review_polarity/txt_sentoken/pos/*.txt')
pos_file_list = pos_file_list[0:N]
#print pos_file_list
neg_file_list = glob.glob('review_polarity/txt_sentoken/neg/*.txt')
neg_file_list = neg_file_list[0:N]
#print neg_file_list
#create a list of review_feature
for i in range(0,N):
    pos_review_list.append(review_feature(open(pos_file_list[i]),dict_list))
    neg_review_list.append(review_feature(open(neg_file_list[i]),dict_list))

# p(pos) = p(neg), so we can ignore both.
# we need to learn each logp(x|c), where x is a word, c is the classification.
# we have 2 * M parameters to learn.
# Question: How laplace prior of 0.1 works
# given classification, the log probability of a given word x
px_pos_list = get_px_list(M,N,pos_review_list)
px_neg_list = get_px_list(M,N,neg_review_list)

with open('poslogp.txt'+str(mode), 'wb') as f:
    pickle.dump(px_pos_list, f)
with open('neglogp.txt'+str(mode), 'wb') as f:
    pickle.dump(px_neg_list, f)






#print pos_review_list





