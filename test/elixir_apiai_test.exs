defmodule ElixirApiaiTest do
  use ExUnit.Case
  doctest ElixirApiai

  test "greets the world" do
    assert ElixirApiai.hello() == :world
  end
end
