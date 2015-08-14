import re

def word_count(sentence):
    split_sentence = re.split(' +| *\n *|\t', sentence)
    output = {}
    for x in split_sentence:
        output[x] = count_word(x, split_sentence)
    return output

def count_word(word, iterable):
    count = 0
    for x in iterable:
        if x == word:
            count += 1
    return count

