from string import ascii_lowercase as all_letters
def is_pangram(sentence):
    for c in all_letters:
        if not c in sentence.lower():
            return False
    return True
