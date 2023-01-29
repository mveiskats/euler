defmodule PrimeETSTest do
  use ExUnit.Case
  doctest PrimeETS

  test "Primes up to 10" do
    primes = PrimeETS.stream(limit: 10) |> Enum.to_list()
    assert primes == [2, 3, 5, 7]
  end
end
