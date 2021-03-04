defmodule Humanizex.StringsTest do
  use ExUnit.Case

  describe "truncate" do
    test "truncate/1 - return an empty string when passing empty text" do
      assert "" = Humanizex.Strings.truncate("")
    end

    test "truncate/1 - return the same text when not passing the lenght" do
      assert "Awesome text to truncate" == Humanizex.Strings.truncate("Awesome text to truncate")
    end

    test "truncate/2 - truncate the text accordingle the passing length" do
      assert "Awesome te..." == Humanizex.Strings.truncate("Awesome text to truncate", 13)
    end

    test "truncate/3 - truncate the text accordingle the passing length and terminator" do
      assert "Awesome tex+" == Humanizex.Strings.truncate("Awesome text to truncate", 12, "+")
    end
  end

  describe "capitalize" do
    test "capitalize/1 - capitalize one single word" do
      assert "Heeeey" == Humanizex.Strings.capitalize("heeeey")
    end

    test "capitalize/2 - capitalize one single word and downcase tail" do
      assert "Heeeeyyy" == Humanizex.Strings.capitalize("heEEeyYy")
    end

    test "capitalize/1 - capitalize one single word and downcase tail" do
      assert "Heeeey Capitalized String" ==
               Humanizex.Strings.capitalize("heeeey capitalized string")
    end
  end
end
