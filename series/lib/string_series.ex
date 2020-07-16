defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size <= 0 do []

  end
  def slices(s, size) do
    slice = s |> String.split("") |> Enum.reject(fn e -> e == "" end)
    windows(slice, size, [])
  end

  @spec windows(any, any, any) :: [any]
  def windows([], size, window) do
    window
    |> Enum.reject(fn e -> Enum.count(e) < size end)
    |> Enum.map(&Enum.join/1)
    |> Enum.sort()
  end

  def windows(slice, size, window) do
    windows(Enum.slice(slice, 1..-1), size, [ Enum.slice(slice, 0..size-1) | window])
  end
end
