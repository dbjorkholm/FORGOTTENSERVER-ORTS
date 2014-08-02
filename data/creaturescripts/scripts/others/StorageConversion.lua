local conversions = {
	rashid = {
		{101, 1},
		{101, 2},
		{102, 1},
		{102, 2},
		{102, 3},
		{102, 4},
		{102, 5},
		{103, 1},
		{103, 2},
		{103, 3},
		{104, 1},
		{104, 2},
		{104, 3},
		{105, 1},
		{105, 2},
		{105, 3},
		{106, 1},
		{106, 2},
		{106, 2},
		{107, 1}
	},
	greenDjinn = {
		{121, 1},
		{122, 1},
		{122, 2},
		{122, 3},
		{122, 4},
		{123, 1},
		{123, 2},
		{123, 3},
		{124, 1},
		{124, 2},
		{124, 3},
		{124, 4}
	},
	blueDjinn = {
		{111, 1},
		{112, 1},
		{112, 2},
		{112, 3},
		{113, 1},
		{113, 2},
		{113, 3},
		{114, 1},
		{114, 2},
		{114, 3},
		{114, 4}
	}
}

local function rashidConversion(player)
	local value = player:getStorageValue(85)
	if value > 0 and player:getStorageValue(107) < 0 then
		for i = 1, value do
			player:setStorageValue(conversions.rashid[i][1], conversions.rashid[i][2])
		end
	end

	if value == 20 then
		player:setStorageValue(85, -1)
	end
end

local function greenDjinnConversion(player)
	local value = player:getStorageValue(81)
	if value > 0 and player:getStorageValue(124) <= 4 then
		for i = 1, value do
			player:setStorageValue(conversions.greenDjinn[i][1], conversions.greenDjinn[i][1])
		end
	end

	if value == 12 then
		player:setStorageValue(81, -1)
	end
end

local function blueDjinnConversion(player)
	local value = player:getStorageValue(82)
	if value > 0 and player:getStorageValue(114) <= 3 then
		for i = 1, value do
			player:setStorageValue(conversions.blueDjinn[i][1], conversions.blueDjinn[i][1])
		end
	end

	if value == 11 then
		player:setStorageValue(82, -1)
	end
end

function onLogin(cid)
	local player = Player(cid)
	rashidConversion(player)
	greenDjinnConversion(player)
	blueDjinnConversion(player)
	return true
end
