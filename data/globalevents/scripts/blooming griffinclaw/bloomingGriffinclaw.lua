local function bloom()
	if math.random(7) == 1 then
		local tile = Position():getTile({x = 32024, y = 32830, z = 4})
		if tile then
			local thing = tile:getItemById(5687)
			if thing and thing:isItem() then
				thing:transform(5659)
				thing:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
		end
		local timeChange = math.random(2, 6)
		addEvent(function() local tile = Position({x = 32024, y = 32830, z = 4}):getTile() if tile then local thing = tile:getItemById(5659) if thing and thing:isItem() then thing:transform(5687) end end end, timeChange * 60 * 60 * 1000)
		return addEvent(bloom, timeChange * 60 * 60 * 1000)
	else
		return addEvent(bloom, 60 * 60 * 1000)
	end
end

function onStartup()
	bloom()
	return true
end
