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

  def solution02() do
    sum(2,501,2,0,1,1)
  end

  def sum(start, final, rate, count, initial, out) do
    case count do
      3 ->
        case start == final do
          true ->
            out + initial + rate
          false ->
            x = initial + rate
            sum(start+1, final, rate + 2, 0, x, out+x)
        end
      _ ->
        x = initial + rate
        sum(start, final, rate, count + 1, x, out+x)
    end

  end
end
