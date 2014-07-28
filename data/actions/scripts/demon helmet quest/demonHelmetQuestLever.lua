local t = {
	Position(33314, 31592, 15), -- stone position
	Position(33316, 31591, 15}, -- teleport creation position
	Position(33322, 31592, 14} -- where the teleport takes you
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		local tile = Position(t[1]):getTile()
		if tile then
			local stone = tile:getItemById(1355)
			if stone and stone:isItem() then
				stone:remove()
			end
		end

		local teleport = Game.createItem(1387, 1, t[2])
		if teleport then
			teleport:setDestination(t[3])
			Position(t[2]):sendMagicEffect(CONST_ME_TELEPORT)
		end
	elseif item.itemid == 1946 then
		local tile = Position(t[2]):getTile()
		if tile then
			local teleport = tile:getItemById(1387)
			if teleport and teleport:isTeleport() then
				teleport:remove()
			end
		end
		Position(t[2]):sendMagicEffect(CONST_ME_POFF)
		Game.createItem(1355, 1, t[1])
	end
	return Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
end