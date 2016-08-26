defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    allergies(flags)
  end

  def allergies(flags) when flags == 0 do
    []
  end

  def allergies(flags) when flags == 1 do
    ["eggs"]
  end

  def allergies(flags) when flags == 2 do
    ["peanuts"]
  end

  def allergies(flags) when flags == 4 do
    ["shellfish"]
  end

  def allergies(flags) when flags == 8 do
    ["strawberries"]
  end

  def allergies(flags) when flags == 16 do
    ["tomatoes"]
  end

  def allergies(flags) when flags == 32 do
    ["chocolate"]
  end

  def allergies(flags) when flags == 64 do
    ["pollen"]
  end

  def allergies(flags) when flags == 128 do
    ["cats"]
  end

  def allergies(flags) do
    next_value = [128, 64, 32, 16, 8, 4, 2, 1] |> Enum.find(0, fn x -> flags >= x end)
    allergies(next_value) ++ allergies(flags - next_value)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    allergies(flags) |> Enum.any?(fn x -> x == item end)
  end
end
