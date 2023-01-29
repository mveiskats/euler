# A Pythagorean triplet is a set of three natural numbers, a < b < c,
# for which, a^2 + b^2 = c^2
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

for a <- 1..998 do
  for b <- a..(999 - a) do
    c = 1000 - a - b
    if a * a + b * b == c * c do
      IO.puts(a * b * c)
    end
  end
end
