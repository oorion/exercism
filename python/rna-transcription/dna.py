def to_rna(nucleotides):
    split_nucleotides = list(nucleotides)
    return "".join(map(convert_nucleotide, split_nucleotides))

def convert_nucleotide(nucleotide):
    if nucleotide == "G":
        return "C"
    elif nucleotide == "C":
        return "G"
    elif nucleotide == "T":
        return "A"
    elif nucleotide == "A":
        return "U"
