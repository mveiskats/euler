# Find largest prime factor of the number 600851475143
defmodule Euler3 do
  def largest_prime_factor(x, current \\ 2, largest \\ nil) do
    cond do
      current > trunc(:math.sqrt(x)) ->
        largest || x
      rem(x, current) == 0 ->
        max(current, largest_prime_factor(div(x, current), current, nil))
      true ->
        largest_prime_factor(x, current + 1, largest)
    end
  end
end

IO.puts Euler3.largest_prime_factor(600851475143)
