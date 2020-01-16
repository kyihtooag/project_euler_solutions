defmodule ProjectEuler.Problem16 do

  def solution() do
    :math.pow(2,1000)
    |> round
    |> Integer.to_string
    |> String.graphemes
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end
end
