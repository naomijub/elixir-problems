defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    list
    |> Enum.reduce([], fn e, acc -> [fun.(e) | acc] end)
    |> Enum.reverse()
  end

  # Or with recursion:
  # def accumulate([], _), do: []
  # def accumulate([head | tail], fun), do: [fun.(head) | accumulate(tail, fun)]
end
