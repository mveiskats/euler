# Given first one hundred natural numbers,
# find the difference between sum of the squares of the numbers
# and square of the sum of the numbers.

range = 1..100
sum_of_squares = range |>
  Enum.map(fn x -> x * x end) |>
  Enum.sum()

sum = Enum.sum(range)
square_of_sum = sum * sum

IO.puts(square_of_sum - sum_of_squares)
