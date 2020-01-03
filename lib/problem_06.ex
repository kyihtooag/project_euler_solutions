defmodule ProjectEuler.Problem06 do

  def solution() do
    sum_of_squares =
      Enum.to_list(1..100)
      |> Enum.reduce(0, fn x, acc -> :math.pow(x,2) + acc end)
      |> round

    square_of_sum =
      Enum.to_list(1..100)
      |> Enum.reduce(0, fn x, acc -> x + acc end)
      |> :math.pow(2)
      |> round

    square_of_sum - sum_of_squares
  end
end
