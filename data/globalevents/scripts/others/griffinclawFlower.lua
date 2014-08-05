local flowerPosition = Position(32024, 32830, 4)

function decayFlower()
	local tile = flowerPosition:getTile()
	if tile then
		local thing = tile:getItemById(5659)
		if thing then
			thing:transform(5687)
		end
	end
end

local function bloom()
	if math.random(7) ~= 1 then
		addEvent(bloom, 60 * 60 * 1000)
		return
	end

	local tile = flowerPosition:getTile()
	if tile then
		local thing = tile:getItemById(5687)
		if thing then
			thing:transform(5659)
			thing:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	end

	local bloomHours = math.random(2, 6)
	addEvent(decayFlower, bloomHours * 60 * 60 * 1000)
	addEvent(bloom, bloomHours * 60 * 60 * 1000)
end

function onStartup()
	bloom()
	return true
end