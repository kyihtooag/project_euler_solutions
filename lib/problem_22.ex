defmodule ProjectEuler.Problem22 do

  @alphabetical_value %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "I" => 9,
    "J" => 10,
    "K" => 11,
    "L" => 12,
    "M" => 13,
    "N" => 14,
    "O" => 15,
    "P" => 16,
    "Q" => 17,
    "R" => 18,
    "S" => 19,
    "T" => 20,
    "U" => 21,
    "V" => 22,
    "W" => 23,
    "X" => 24,
    "Y" => 25,
    "Z" => 26,
    ""  => 0
  }

  def solution() do
    IO.inspect(DateTime.utc_now)
    case File.read("p022_names.txt") do
      {:ok, content} ->
        names_list = content
                    |> String.replace("\"", "")
                    |> String.split(",")
                    |> Enum.sort()
        Enum.map(0..(length(names_list) -1), fn x ->
          name = Enum.fetch(names_list, x) |> elem(1)
          (x + 1) * (name_score(name))
        end)
        |> Enum.sum
        |> IO.inspect()
      {:error, _} ->
        :error
    end
    IO.inspect(DateTime.utc_now)
  end

  def name_score(name) do
    String.split(name, "")
    |> Enum.map(fn x ->  @alphabetical_value[x] end)
    |> Enum.sum
  end
end
