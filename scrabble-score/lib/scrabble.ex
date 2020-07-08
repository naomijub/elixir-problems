defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @letters_map %{
    ""           => 0,
    "aeioulnrstAEIOULNRST" => 1,
    "dgDG"         => 2,
    "bcmpBCMP"       => 3,
    "fhvwyFHVWY"      => 4,
    "kK"          => 5,
    "jxJX"         => 8,
    "qzQZ"         => 10
  }
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
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
