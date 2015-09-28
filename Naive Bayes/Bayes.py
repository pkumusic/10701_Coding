from functions import *
file_pos = open('opinion-lexicon-English/positive-words.txt')
file_neg = open('opinion-lexicon-English/negative-words.txt')
dict_list = add_dictionary([],file_pos)
#print len(dict_list)
dict_list = add_dictionary(dict_list,file_neg)
#print len(dict_list)
M = len(dict_list)
print M
#print dict_list
file2




