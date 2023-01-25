# Find 10 001st prime number
defmodule Euler7 do
  def find_nth_prime(n, limit) do
    sieve = :ets.new(:sieve, [:ordered_set, :private])
    prime = find_next_primes(n, 2, sieve, ceil(2 * limit))
    :ets.delete(sieve)
    prime
  end

  def find_next_primes(_count, current, _sieve, limit) when current > limit do
    {:error, "Limit exceeded"}
  end

  def find_next_primes(count, current, sieve, limit) do
    case :ets.lookup(sieve, current) do
      [] ->
        if count == 1 do
          {:ok, current}
        else
          :ets.insert(sieve, {current, true})
          for x <- (2 * current)..limit//current, do: :ets.insert(sieve, {x, false})
          find_next_primes(count - 1, current + 1, sieve, limit)
        end
      _ ->
        find_next_primes(count, current + 1, sieve, limit)
    end
  end
end

# Search range can be estimated using prime number theorem.
# Plugging 10001 into it and feeding it into a solver gets us ~ 116684
# Solving this programmatically involves complex numbers
# and Lambert W function, which currently is beyond me.
IO.puts inspect(Euler7.find_nth_prime(10_001, 116684))
