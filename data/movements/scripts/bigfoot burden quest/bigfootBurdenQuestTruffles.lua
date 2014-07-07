function onStepIn(cid, item, position, lastPosition)
	if string.lower(Creature():getName()) == "mushroom sniffer" then
		chance = math.random(1, 3)
		if(Tile(position):getItemById(18340) > 0 and Tile(position):getItemById(18340) ~= 100) then
			if chance < 3 then
				toPosition():sendMagicEffect(CONST_ME_POFF)
				Item(item.uid):transformItem(Tile(position):getItemById(18340), 18218)
				addEvent(Item(item.uid):transformItem, 40 * 1000, Tile(position):getItemById(18218), 18340)
			elseif chance == 3 then
				Item(item.uid):transformItem(Tile(position):getItemById(18340), 18341)
				toPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
			end
		end
	end
	return true
end
