defmodule ProjectEuler.Problem09 do

  def solution() do
    Enum.map(1..1000, fn a ->
      Enum.map(1000..(a+1), fn b ->
          c = 1000 - (a+b)
          case (:math.pow(a,2) + :math.pow(b,2)) == :math.pow(c,2) do
            true ->
              a * b * c
            false ->
              nil
          end
      end)
      |> Enum.filter(fn x -> x != nil end)
    end)
    |> Enum.filter(fn x -> x != [] end)
  end
end
