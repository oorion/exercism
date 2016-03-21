def prime_factors(number):
    prime_factor_list = []
    while True:
        for n in range(2, number + 1):
            if is_prime(n) and number % n == 0:
                prime_factor_list.append(n)
                number = number / n
                break
        if number == 1:
            break
    return prime_factor_list

def is_prime(number):
    if number == 1:
        return False
    for n in range(2, number):
        if number % n == 0:
            return False
    return True
