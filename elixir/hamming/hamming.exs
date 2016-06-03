defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    if length(strand1) != length(strand2) do
      nil
    else
      strand1_with_index = Enum.with_index(strand1)

      fun = fn(x, acc) ->
        if elem(x, 0) != Enum.at(strand2, elem(x,1)) do
          acc = acc + 1
          acc
        else
          acc
        end
      end
      Enum.reduce(strand1_with_index, 0, fun)
    end
  end
end
