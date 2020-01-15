defmodule ProjectEuler.Problem29 do

  def solution() do
    distinct_power(MapSet.new, 2, 2, 100)
  end

  def distinct_power(out, a, b, limit) when a <= limit do
    case b == limit do
      true ->
        distinct_power(MapSet.put(out, :math.pow(a,b) |> round ), a + 1, 2, limit)
      false ->
        distinct_power(MapSet.put(out, :math.pow(a,b) |> round ), a, b + 1, limit)
    end
  end

  def distinct_power(out, a, _b, limit) when a > limit do
    MapSet.to_list(out) |> length
  end
end
