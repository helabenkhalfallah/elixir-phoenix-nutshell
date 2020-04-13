defmodule ElixirPhoenixNutshellTest do
  use ExUnit.Case
  doctest ElixirPhoenixNutshell

  test "greets the world" do
    assert ElixirPhoenixNutshell.hello() == :world
  end
end
