return function(n)
	local result = ""

	local sounds = {
		{ 3, "Pling" },
		{ 5, "Plang" },
		{ 7, "Plong" },
	}

	for _, combination in pairs(sounds) do
		if n % combination[1] == 0 then
			result = result .. combination[2]
		end
	end

	if result == "" then
		return tostring(n)
	end

	return result
end
