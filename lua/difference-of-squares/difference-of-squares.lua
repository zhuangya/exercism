local function square_of_sum(n)
  -- local result = 0
  -- for i = 1, n do
  --   result = result + i
  -- end
  --
  -- return result ^ 2
  return (n * (n + 1) / 2) ^ 2
end

local function sum_of_squares(n)
  -- local result = 0
  -- for i = 1, n do
  --   result = result + i ^ 2
  -- end
  -- return result
  --
  return n * (n + 1) * (2 * n + 1) / 6
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return { square_of_sum = square_of_sum, sum_of_squares = sum_of_squares, difference_of_squares = difference_of_squares }
