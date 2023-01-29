# Find the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20

Mix.install [{:prime_ets, path: "prime_ets"}]

defmodule Euler5 do
  def factor_power(n, factor) when rem(n, factor) != 0, do: 0

  def factor_power(n, factor) do
    1 + factor_power(div(n, factor), factor)
  end

  def factor_powers(n, factors) do
    for factor <- factors, do: factor_power(n, factor)
  end

  def least_common_multiple(limit) do
    primes = PrimeETS.stream(limit: limit) |> Enum.to_list()

    powers = 2..limit |>
      Enum.map(fn n -> factor_powers(n, primes) end) |>
      Enum.zip() |>
      Enum.map(fn factors -> Enum.max(Tuple.to_list(factors)) end)

    powers |>
      Enum.zip(primes) |>
      Enum.map(fn {power, n} -> round(:math.pow(n, power)) end) |>
      Enum.reduce(fn x, acc -> x * acc end)
  end
end

Euler5.least_common_multiple(20) |> IO.puts()
