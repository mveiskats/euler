defmodule PrimeETS do
  @moduledoc """
  Generate prime numbers using Erlang built-in ETS
  """

  @doc """
  Creates a stream of prime numbers which are no greater than given limit
  """
  def stream(limit: limit) do
    sieve = :ets.new(:sieve, [:ordered_set, :private])
    Stream.resource(
      fn -> 1 end,
      fn previous -> find_next_prime(previous + 1, sieve, limit) end,
      fn _ -> :ets.delete(sieve) end
    )
  end

  defp find_next_prime(current, _sieve, limit) when current > limit do
    {:halt, limit}
  end

  defp find_next_prime(current, sieve, limit) do
    case :ets.lookup(sieve, current) do
      [] ->
        :ets.insert(sieve, {current, true})
        for x <- (2 * current)..limit//current, do: :ets.insert(sieve, {x, false})
        {[current], current}
      _ ->
        find_next_prime(current + 1, sieve, limit)
    end
  end
end
