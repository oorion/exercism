defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    primes = Enum.filter(2..1000, &is_prime(&1)) |> List.to_tuple
    elem(primes, count - 1)
  end

  def is_prime(n) do
    if n != 2 do
      !Enum.any?(2..n-1, fn divisor -> rem(n, divisor) == 0 end)
    else
      true
    end
  end
end
