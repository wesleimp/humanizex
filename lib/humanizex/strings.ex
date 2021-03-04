defmodule Humanizex.Strings do
  @moduledoc """
  This module handles everything related to strings.
  """

  @doc """
  Truncates a string if it is longer than the specified number of characters (inclusive).

  Truncated strings will end with a translatable ellipsis sequence ("…").

  ## Examples

  	iex> Humanizex.Strings.truncate("Some text")
  	"Some text"

  	iex> Humanizex.Strings.truncate("Some awesome text", 12)
  	"Some awes..."

  	iex> Humanizex.Strings.truncate("Some awesome text", 12, "--")
  	"Some aweso--"
  """
  @spec truncate(String.t()) :: String.t()
  @spec truncate(String.t(), Integer.t()) :: String.t()
  @spec truncate(String.t(), Integer.t(), String.t()) :: String.t()

  def truncate(text), do: text

  def truncate(text, len, ending \\ "...") do
    if String.length(text) > len do
      n = len - String.length(ending)
      String.slice(text, 0..(n - 1)) <> ending
    else
      text
    end
  end

  @doc """
  Capitalizes the first letter of each word in a string.

  ## Examples

  	iex> Humanizex.Strings.capitalize("heeeey")
  	"Heeeey"

  	iex> Humanizex.Strings.capitalize("heEEeyYy")
  	"Heeeeyyy"

  	iex> Humanizex.Strings.capitalize("heeeey capitalized string")
  	"Heeeey Capitalized String"
  """
  @spec capitalize(String.t()) :: String.t()
  def capitalize(text) do
    text
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
