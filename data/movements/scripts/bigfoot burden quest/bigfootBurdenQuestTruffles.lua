function onStepIn(cid, item, position, lastPosition)
	local tile = Tile(position)

	if string.lower(Creature():getName()) == "mushroom sniffer" then
		chance = math.random(1, 3)
		if(tile:getItemById(18340) and tile:getItemById(18340):getActionId() ~= 100) then
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
