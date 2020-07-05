defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @letters "abcdefghijklmnopqrstuvwxyz" 
  @capital "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.graphemes
    |> Enum.map(fn x -> 
      cond do
        String.contains?(@letters, x) -> rotate_element(@letters, x, shift)
        String.contains?(@capital, x) -> rotate_element(@capital, x, shift)
        true -> x
      end
    end)
    |> Enum.join

  end

  def rotate_element(alphabet, element, shift) do
    {el_idx, _} = :binary.match(alphabet, element)
    new_idx = rem(el_idx + shift, alphabet |> String.length)

    String.at(alphabet, new_idx)
  end
end
