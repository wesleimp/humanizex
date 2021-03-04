defmodule Humanizex.Numbers do
  @moduledoc """
	This module handles everything related to numbers.
  """

  @doc """
  Truncates a number to an upper bound.

  ## Examples

  	iex> Humanizex.Numbers.bounded(150, 100)
  	"100+"

  	iex> Humanizex.Numbers.bounded(50, 100)
  	"50"
  """
  @spec bounded(integer()) :: String.t()
  @spec bounded(integer(), integer()) :: String.t()
  @spec bounded(integer(), integer(), String.t()) :: String.t()
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
  @spec ordinal(integer()) :: String.t()
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

  @doc """
  Ensures precision value is a positive integer.

  ## Examples

  	iex> Humanizex.Numbers.normalize_precision(-232.231)
  	232
  """
  @spec normalize_precision(integer()) :: integer()
  def normalize_precision(number) do
    number
    |> abs
    |> round()
  end
end
