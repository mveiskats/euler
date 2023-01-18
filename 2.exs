# Find sum of all even-valued numbers in Fibonacci sequence
# that do not exceed four million

limit = 4_000_000

next_fun = fn
  {} -> {1, {nil, 1}}
  {nil, 1} -> {2, {1, 2}}
  {previous, current} ->
    next = previous + current
    {next, {current, next}}
end

fib = Stream.unfold({}, next_fun)
even_fib = Stream.filter(fib, fn x -> rem(x, 2) == 0 end)
total = Stream.take_while(even_fib, fn x -> x < limit end) |> Enum.sum

IO.puts total
