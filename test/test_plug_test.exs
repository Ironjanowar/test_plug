defmodule TestPlugTest do
  use ExUnit.Case
  doctest TestPlug

  test "greets the world" do
    assert TestPlug.hello() == :world
  end
end
