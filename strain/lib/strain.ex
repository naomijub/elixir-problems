defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    list
    |> Enum.reduce([], fn x, acc -> 
      case fun.(x) do 
        true -> [x | acc]
        false -> acc
      end
    end)
    |> Enum.reverse
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list
    |> Enum.reduce([], fn x, acc -> 
      case fun.(x) do 
        false -> [x | acc]
        true -> acc
      end
    end)
    |> Enum.reverse
  end
end
