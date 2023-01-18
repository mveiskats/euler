# Find the sum of all the multiples of 3 or 5 below 1000.
multiples = Stream.filter(1..999, fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)

IO.puts multiples |> Enum.sum
