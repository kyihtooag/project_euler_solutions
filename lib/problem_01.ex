defmodule ProjectEuler.Problem01 do

  def solution() do
    Enum.to_list(1..999)
    |> Enum.filter(fn x -> rem(x,3) == 0 or rem(x,5) == 0  end)
    |> Enum.sum
  end
end
