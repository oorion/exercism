defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    split_sentence = split_sentence(sentence)
    words_and_count = convert_to_words_and_count(split_sentence)
    Enum.into(words_and_count, %{})
  end

  def split_sentence(sentence) do
    String.split(format_and_filter(sentence))
  end
  
  def format_and_filter(sentence) do
    filtered_sentence = String.replace(sentence, ~r/[^\w -]+/u, "")
    filtered_sentence = String.replace(filtered_sentence, ~r/_/, " ")
    String.downcase(filtered_sentence)
  end

  def convert_to_words_and_count(words) do
    Enum.map(words, fn y -> {y, Enum.count(words, fn z -> z == y end)} end) 
  end
end
