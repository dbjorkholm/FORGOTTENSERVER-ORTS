function onStepIn(cid, item, position, fromPosition)

	if string.lower(Creature(cid):getName()) == "mushroom sniffer" then
		local tile = Tile(position)
		if tile:getItemById(18340) and tile:getItemById(18340):getActionId() ~= 100 then
			local chance = math.random(3)
			if chance < 3 then
				position:sendMagicEffect(CONST_ME_POFF)
				tile:getItemById(18340):transform(18218)
				addEvent(function(position) local tile = Tile(position) if not tile then return end local thing = tile:getItemById(18218) if thing then thing:transform(18340) end end, 40000, position)
			elseif chance == 3 then
				tile:getItemById(18340):transform(18341)
				position:sendMagicEffect(CONST_ME_GROUNDSHAKER)
			end
		end
	end
	return true
end
