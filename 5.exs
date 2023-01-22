# Find the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20
defmodule Euler5 do
  def prime?(2), do: true

  def prime?(n) do
    # Can just brute-force at low values of n
    2..(n - 1) |> Enum.all?(fn i -> rem(n, i) != 0 end)
  end

  def factor_power(n, factor) when rem(n, factor) != 0, do: 0

  def factor_power(n, factor) do
    1 + factor_power(div(n, factor), factor)
  end

  def prime_factor_powers(n, limit) do
    2..limit |> Enum.map(fn
      factor -> if prime?(factor) do factor_power(n, factor) end || 0
    end)
  end

  def least_common_multiple(limit) do
    powers = 2..limit |>
      Enum.map(fn f -> prime_factor_powers(f, limit) end) |>
      Enum.zip() |>
      Enum.map(fn factors -> Enum.max(Tuple.to_list(factors)) end)

    Enum.zip([2..limit, powers]) |>
      Enum.map(fn {n, power} -> round(:math.pow(n, power)) end) |>
      Enum.reduce(fn x, acc -> x * acc end)
  end
end

IO.puts(Euler5.least_common_multiple(20))
