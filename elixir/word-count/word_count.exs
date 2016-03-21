defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> split_sentence |> convert_to_words_and_count |> Enum.into(%{})
  end

  def split_sentence(sentence) do
    sentence |> format_and_filter |> String.split
  end

  def format_and_filter(sentence) do
    sentence |> String.replace(~r/[^\w -]+/u, "") |> String.replace(~r/_/, " ") |> String.downcase
  end

  def convert_to_words_and_count(words) do
    Enum.map(words, fn y -> {y, Enum.count(words, fn z -> z == y end)} end)
  end
end
