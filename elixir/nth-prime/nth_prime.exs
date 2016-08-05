defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    if count == 0 do
      raise Error
    end
    prime_number_and_count = {2, 1}
    find_nth_prime(prime_number_and_count, count)
  end

  def find_nth_prime(prime_number_and_count, desired_count) do
    if elem(prime_number_and_count, 1) == desired_count do
      elem(prime_number_and_count, 0)
    else
      current_prime = elem(prime_number_and_count, 0)
      current_count = elem(prime_number_and_count, 1)
      {find_next_prime(current_prime), current_count + 1} |> find_nth_prime(desired_count)
    end
  end

  def find_next_prime(prime_number) do
    find_next_prime(prime_number, 1)
  end

  def find_next_prime(prime_number, n) do
    if is_prime(prime_number + n) do
      prime_number + n
    else
      find_next_prime(prime_number, n + 1)
    end
  end

  def is_prime(n) do
    if n != 2 do
      !Enum.any?(2..n-1, fn divisor -> rem(n, divisor) == 0 end)
    else
      true
    end
  end
end
