local config = {
	[3045] = {Position({x = 32784, y = 32222, z = 14}), 7844},
	[3046] = {Position({x = 32785, y = 32230, z = 14}), 7846},
	[3047] = {Position({x = 32781, y = 32226, z = 14}), 7845}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[item.uid]
	if not targetItem then
		return true
	end
	
	if item.itemid == 1945 then
		local tile = targetItem[1]:getTile()
		if tile then
			local thing = tile:getItemById(2145)
			if thing and thing:isItem() then
				Item(item.uid):transform(1946)
				targetItem[1]:sendMagicEffect(CONST_ME_TELEPORT)
				Game.createItem(targetItem[2], 1, targetItem[1])
				thing:remove()
				addEvent(function(toPosition) local tile = toPosition:getTile() if tile then local thing = tile:getItemById(1946) if thing and thing:isItem() then thing:transform(1945) end end end, 4 * 1000, toPosition)
			end
		end
	end
	return true
end