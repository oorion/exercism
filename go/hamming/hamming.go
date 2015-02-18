package hamming

import (
	"errors"
)

const TestVersion = 2

func Distance(strand1 string, strand2 string) (int, error) {
	var count int

	if len(strand1) != len(strand2) {
		return -1, errors.New("blah")
	}

	for index, strand1Char := range strand1 {
		strand2Char := rune(strand2[index])

		if strand1Char != strand2Char {
			count++
		}
	}

	return count, nil
}
