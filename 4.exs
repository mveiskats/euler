# Find largest palindrome made from the product of two 3-digit numbers
defmodule Euler4 do
  def palindrome?(x) do
    str = to_string(x)
    str == String.reverse(str)
  end

  def largest_palindrome do
    for i <- 1..999, j <- i..999, prod = i * j, palindrome?(prod), reduce: 0 do
      largest -> max(largest, prod)
    end
  end
end

IO.puts inspect(Euler4.largest_palindrome())
