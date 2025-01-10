local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local n = number
  local i = math.floor(math.log10(number)) + 1
  while n > 0 do
    local r = n % 10
    number = number - math.pow(r, i)
    n = math.floor(n / 10)
  end

  return number == 0
end

return ArmstrongNumbers
