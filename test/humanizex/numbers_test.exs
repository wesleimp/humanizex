defmodule Humanizex.NumbersTest do
  use ExUnit.Case

  alias Humanizex.Numbers

  describe "bounded" do
    test "bounded/1 - shows the ending for a up number using defaults" do
      assert "100+" == Numbers.bounded(150)
    end

    test "bounded/2 - shows the ending for a up number setting the bound" do
      assert "300+" == Numbers.bounded(310, 300)
    end

    test "bounded/2 - shows the ending for a up number setting the bound and terminator" do
      assert "300-" == Numbers.bounded(310, 300, "-")
    end
  end

  describe "ordinal" do
    test "when zero return zero with th" do
      assert "0th" == Numbers.ordinal(0)
    end

    test "when the number terminates in 11, 12 or 13 return whith th" do
      assert "11th" == Numbers.ordinal(11)
      assert "12th" == Numbers.ordinal(12)
      assert "13th" == Numbers.ordinal(13)

      assert "211th" == Numbers.ordinal(211)
      assert "212th" == Numbers.ordinal(212)
      assert "213th" == Numbers.ordinal(213)
    end

    test "returns the correct term" do
      assert "1st" == Numbers.ordinal(1)
      assert "2nd" == Numbers.ordinal(2)
      assert "3rd" == Numbers.ordinal(3)
      assert "4th" == Numbers.ordinal(4)

      assert "31st" == Numbers.ordinal(31)
      assert "32nd" == Numbers.ordinal(32)
      assert "33rd" == Numbers.ordinal(33)
      assert "34th" == Numbers.ordinal(34)
    end
  end

  describe "normalize_precision" do
    test "Normalizes the given precision" do
      assert 232 == Numbers.normalize_precision(-232.231)
    end
  end
end
