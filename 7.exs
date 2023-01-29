# Find 10 001st prime number

Mix.install [{ :prime_ets, path: "prime_ets" }]

# Search range can be estimated using prime number theorem.
# Plugging 10001 into it and feeding it into a solver gets us ~ 116684
# Solving this programmatically involves complex numbers
# and Lambert W function, which is an exercise left to the reader.

PrimeETS.stream(limit: 116684) |>
  Stream.take(10_001) |>
  Enum.at(-1) |>
  IO.puts()
