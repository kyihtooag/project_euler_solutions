defmodule ProjectEuler.Problem21 do

  def solution() do
    Enum.map(1..10000, fn x ->
      sum = divisor_sum(x)
      reverse_sum = divisor_sum(sum)
      case sum != x and x == reverse_sum do
        true -> [sum, reverse_sum]
        false -> []
      end
    end)
    |> List.flatten
    |> MapSet.new()
    |> MapSet.to_list
    |> Enum.sum
  end

  defp divisor_sum(number) when number > 1 do
    Enum.filter(1..(number-1), fn x ->
      rem(number, x) == 0
    end)
    |> Enum.sum
  end

  defp divisor_sum(number) when number <= 1 do
    1
  end
end
