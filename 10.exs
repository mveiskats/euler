# Find the sum of all the primes below two million.

Mix.install [{ :prime_ets, path: "prime_ets" }]

PrimeETS.stream(limit: 2_000_000 - 1) |>
  Enum.sum() |>
  IO.puts()
