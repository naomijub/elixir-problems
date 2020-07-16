defmodule ResistorColor do
  @moduledoc false
  @codes %{
    "black" => 0,
    "brown" =>  1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9,
  }

  @spec colors() :: list(String.t())
  def colors do
    @codes |> Enum.to_list() |> Enum.sort_by(fn {_, i} -> i end) |> Enum.map(fn {e, _} -> e end)
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    @codes[color]
  end
end
