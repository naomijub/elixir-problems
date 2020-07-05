defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @units %{
    "0" => "",
    "1" => "I",
    "2" => "II",
    "3" => "III",
    "4" => "IV",
    "5" => "V",
    "6" => "VI",
    "7" => "VII",
    "8" => "VIII",
    "9" => "IX"
  }

  @dec %{
    "0" => "",
    "1" => "X",
    "2" => "XX",
    "3" => "XXX",
    "4" => "XL",
    "5" => "L",
    "6" => "LX",
    "7" => "LXX",
    "8" => "LXXX",
    "9" => "XC"
  }

  @cent %{
    "0" => "",
    "1" => "C",
    "2" => "CC",
    "3" => "CCC",
    "4" => "CD",
    "5" => "D",
    "6" => "DC",
    "7" => "DCC",
    "8" => "DCCC",
    "9" => "CM"
  }

  @mil %{
    "0" => "",
    "1" => "M",
    "2" => "MM",
    "3" => "MMM"
  }

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> Integer.to_string
    |> String.split("")
    |> Enum.reject(fn n -> n == "" end)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.map(&(val(&1)))
    |> Enum.reverse
    |> Enum.join
  end

  def val({v, 0}) do 
    @units[v]
  end

  def val({v, 1}) do 
    @dec[v]
  end

  def val({v, 2}) do 
    @cent[v]
  end

  def val({v, 3}) do 
    @mil[v]
  end
end
