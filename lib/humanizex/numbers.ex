defmodule Humanizex.Numbers do
  @moduledoc false

  @doc """
  Truncates a number to an upper bound.

  ## Examples

  	iex> Humanizex.Numbers.bounded(150, 100)
  	"100+"

  	iex> Humanizex.Numbers.bounded(50, 100)
  	"50"
  """
  @spec bounded(Integer.t()) :: String.t()
  @spec bounded(Integer.t(), Integer.t()) :: String.t()
  @spec bounded(Integer.t(), Integer.t(), String.t()) :: String.t()
  def bounded(num, bound \\ 100, ending \\ "+") do
    case num > bound do
      true -> "#{bound}#{ending}"
      false -> num
    end
  end

  @doc """
  Converts an integer to its ordinal as a string.

  ## Examples

  	iex> Humanizex.Numbers.bounded(0)
  	"0th"

  	iex> Humanizex.Numbers.bounded(11)
  	"11th"

  	iex> Humanizex.Numbers.bounded(21)
  	"21st"
  """
  @spec ordinal(Integer.t()) :: String.t()
  def ordinal(0), do: "#{0}th"
  def ordinal(value) when rem(value, 100) in [11, 12, 13], do: "#{value}th"

  def ordinal(value) do
    pos =
      case rem(value, 10) do
        1 -> "st"
        2 -> "nd"
        3 -> "rd"
        _ -> "th"
      end

    "#{value}#{pos}"
  end

  def normalize_precision(number) do
    number
    |> abs
    |> round()
  end
end
