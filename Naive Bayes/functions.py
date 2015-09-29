from math import log
#mode: 0 - basic; 1 - with not; 2 - bi-gram
mode = 2

def add_dictionary(ori_list, file):
    """
    :param list: original list containing all words
    :param file: new file containing words to be added
    :return: new list containing all words
    """
    w_list = list(file)
    #print w_list
    for w in w_list:
        word = w.rstrip()
        ori_list.append(word)
    #print word_list
    ori_list.sort()
    return ori_list

def add_not(ori_list):
    """
    :param ori_list: original dictionary
    :return: dictionary with not_prefix
    """
    new_list = ori_list[:]
    for word in ori_list:
        new_list.append('not_'+word)
    new_list.sort()
    return new_list

def add_bigram(ori_list):
    """
    :param ori_list:
    :return: dictionary with extremely, quite, just, almost, very, too, enough
    """
    new_list = []
    for word in ori_list:
        for prefix in ['extremely', 'quite', 'just', 'almost', 'very', 'too', 'enough']:
            new_list.append(prefix + '_' + word)
    new_list.sort()
    return new_list



def review_feature(review_file, dict_list):
    """
    :param review_file: the review file
    :param dict_list: the dictionary containing words used as features
    :return: a list containing the indices of the review where the word exists in the
    vocabulary. For example: [0,144,233] mean the review contains 0th,144th,233th word
    in the vocabulary
    """
    # input review

    review = review_file.read()
    #print review
    #convert the review to a list of words
    review_words = review.split(' ')
    #print review_words
    # clean the list
    review_words = map(strip,review_words)
    #print review_words
    # match the words to the dictionary list and save the index
    feature_list = []
    if mode is 0:
        for word in review_words:
            if word in dict_list:
                word_index = dict_list.index(word)
                if word_index not in feature_list:
                    feature_list.append(word_index)
            else:
                continue
    ## Not mode. All the words with the former word which is
    elif mode is 1:
        for i in range(0,len(review_words)):
            word = review_words[i]
            if review_words[i] in dict_list:
                if i > 1 and (review_words[i-1] == 'not' or review_words[i-1].endswith("n't")):
                    word = 'not_' + word
                word_index = dict_list.index(word)
                if word_index not in feature_list:
                    feature_list.append(word_index)
    elif mode is 2:
        prefix = ['extremely', 'quite', 'just', 'almost', 'very', 'too', 'enough']
        for i in range(0,len(review_words)):
            word = review_words[i]
            if review_words[i] in dict_list:
                if i > 1 and (review_words[i-1] == 'not' or review_words[i-1].endswith("n't")):
                    word = 'not_' + word
                elif i > 1 and review_words[i-1] in prefix:
                    word = review_words[i-1] + '_' + word
                word_index = dict_list.index(word)
                if word_index not in feature_list:
                    feature_list.append(word_index)

    feature_list.sort()
    #print feature_list
    return feature_list

def get_px_list(M,N,review_list):
    """
    :param M: The size of vocabulary
    :param N: The number of data in a class
    :param review_list: a list containing all review features
    :return: a list of px given class
    """
    # Question: How laplace prior of 0.1 works
    px_list = []
    for i in range(0,M):
        count = 0
        for j in range(0,N):
            if i in review_list[j]:
                count += 1
        if count != 0:
            logp = log(float(count)/N+0.1)
        else:
            logp = log(0.1)
        px_list.append(logp)
    return px_list

file_pos = open('opinion-lexicon-English/positive-words.txt')
file_neg = open('opinion-lexicon-English/negative-words.txt')
dict_list = add_dictionary([],file_pos)
#print len(dict_list)
dict_list = add_dictionary(dict_list,file_neg)
#print len(dict_list)
### Not mode
if mode is 1:
    dict_list = add_not(dict_list)
if mode is 2:
    dict_list1 = add_not(dict_list)
    dict_list2 = add_bigram(dict_list)
    dict_list = dict_list1 + dict_list2
    dict_list.sort()
print dict_list
M = len(dict_list)
print M
# number of pos and neg training set
N = 800
# number of pos and neg total
TotalN = 1000

def strip(str):
    return str.replace('\n','')

def get_predict(test_file_list, dict_list, px_pos_list, px_neg_list, N):
    """
    :param test_file_list:
    :param dict_list:
    :param px_pos_list:
    :param px_neg_list:
    :return: prediction result
    """
    pos_predict_result = []
    for i in range(0,N):
        features = review_feature(open(test_file_list[i]),dict_list)
        sum_p_pos = 0
        sum_p_neg = 0
        for j in features:
            sum_p_pos += px_pos_list[j]
            sum_p_neg += px_neg_list[j]
        if sum_p_pos > sum_p_neg:
            pos_predict_result.append(1)
        elif sum_p_pos < sum_p_neg:
            pos_predict_result.append(0)
        ## use -1 to represent both pos and neg are OK
        else:
            pos_predict_result.append(-1)
    return pos_predict_result