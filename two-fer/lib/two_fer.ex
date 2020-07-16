defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  def two_fer(name) when not is_binary(name) do
    raise FunctionClauseError
  end

  @spec two_fer(String.t()) :: String.t()
  def two_fer(name) do
    "One for #{name}, one for me"
  end

  @spec two_fer() :: String.t()
  def two_fer() do
    two_fer("you")
  end
end
