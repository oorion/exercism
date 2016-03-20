def distance(nucleotides1, nucleotides2):
    distance = 0
    for i in range(0, len(list(nucleotides1))):
        if list(nucleotides1)[i] != list(nucleotides2)[i]:
            distance += 1
    return distance
