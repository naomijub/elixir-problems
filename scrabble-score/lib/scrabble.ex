defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @letters_map %{
    ""           => 0,
    "aeioulnrst" => 1,
    "dg"         => 2,
    "bcmp"       => 3,
    "fhvwy"      => 4,
    "k"          => 5,
    "jx"         => 8,
    "qz"         => 10
  }
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn g ->  letter_value(g) end)
    |> Enum.sum()

  end

  def letter_value(letter) do
    key = @letters_map
    |> Map.keys()
    |> Enum.find(fn l -> String.contains?(l, letter) end)

    Map.get(@letters_map, key, 0)
  end
end
