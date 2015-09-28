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


def review_feature(file, dict_list):
    """
    :param file:
    :param dict_list:
    :return:
    """