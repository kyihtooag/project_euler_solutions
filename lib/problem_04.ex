defmodule ProjectEuler.Problem04 do

  def solution() do
    Enum.to_list(999..100)
    |> Enum.map(fn a ->
            Enum.map(a..100, fn b ->
                  x = a * b |> to_string()
                  case String.reverse(x) == x do
                      true ->
                        a * b
                      false ->
                        nil
                  end
            end)
    end)
    |> List.flatten
    |> Enum.filter(fn x -> x != nil end)
    |> Enum.sort(&(&1 > &2))
    |> List.first
  end
end
