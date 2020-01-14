defmodule ProjectEuler.Problem28 do
  require Integer

  def solution() do
    oddList = Enum.filter(1..1001, fn x -> Integer.is_odd(x) end)
    Enum.map(0..(length(oddList)-2), fn x ->
      start_number = Enum.fetch(oddList, x) |> elem(1) |> :math.pow(2)
      current_number  = Enum.fetch(oddList, (x+1)) |> elem(1)
      rate = current_number - 1
      Enum.map(1..4, fn x ->
        (x*rate) + start_number
      end)
    end)
    |> List.flatten
    |> List.insert_at(0, 1)
    |> Enum.sum
  end
end
