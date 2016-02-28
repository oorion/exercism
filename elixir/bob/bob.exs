defmodule Bob do
  def hey(input) do
    cond do
      is_empty_string?(input) -> "Fine. Be that way!"
      is_yelling?(input) -> "Whoa, chill out!"
      is_asking_question?(input) -> "Sure."
      true -> "Whatever." 
    end
  end

  def is_yelling?(input) do
    String.upcase(input) == input && Regex.run(~r/\p{L}/u, input)
  end

  def is_asking_question?(input) do
    String.last(input) == "?"
  end

  def is_empty_string?(input) do
    String.strip(input) == ""
  end
end 
