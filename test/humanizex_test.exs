defmodule HumanizexTest do
  use ExUnit.Case
  doctest Humanizex

  test "greets the world" do
    assert Humanizex.hello() == :world
  end
end
