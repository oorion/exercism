defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    grab_letters(string) |> join_and_upcase
  end

  def grab_letters(string) do
    Regex.scan(~r/\b\p{L}|\p{Lu}/, string)
  end

  def join_and_upcase(words) do
    Enum.join(words) |> String.upcase
  end
end
