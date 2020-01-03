defmodule ProjectEuler.Problem19 do

  def solution() do
    normal_year = [31,28,31,30,31,30,31,31,30,31,30,31]
    leap_year = [31,29,31,30,31,30,31,31,30,31,30,31]

    # total_days_of_months =
      Enum.map(1901..2000, fn x ->
        case rem(x, 4) == 0 do
          true ->
            leap_year
          false ->
            normal_year
        end
      end)
      |> List.flatten
      |> recursive(0)
      |> Enum.count(fn x -> rem(x,7) == 5 end)
  end

  defp recursive(total_days_of_months, index) do
    current_month = Enum.fetch(total_days_of_months, index) |> elem(1) |> IO.inspect
    next_month = Enum.fetch(total_days_of_months, index + 1) |> elem(1) |> IO.inspect
    case index == 1198 do
      true ->
        List.replace_at(total_days_of_months, index+1, next_month + (rem(current_month,7)))
      false ->
        nex_array = List.replace_at(total_days_of_months, index+1, next_month + (rem(current_month,7)))
        recursive(nex_array, index + 1)
    end
  end

  def solution2() do
    Enum.map(1901..2000, fn y ->
      Enum.map(1..12, fn m ->
        date = Date.new(y, m, 1) |> elem(1)
        Date.day_of_week(date)
      end)
    end)
    |> List.flatten
    |> Enum.filter(fn x -> x == 7 end)
    |> length()
  end
end
