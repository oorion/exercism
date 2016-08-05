defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &does_it_match(base, &1))
  end

  defp does_it_match(base, word) do
    downcase_and_sort(word) == downcase_and_sort(base) and String.downcase(word) != String.downcase(base)
  end

  defp downcase_and_sort(word) do
    word |> String.downcase |> String.codepoints |> Enum.sort
  end
end
