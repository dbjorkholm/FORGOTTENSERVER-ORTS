function onUse(cid, item, frompos, item2, topos)

	local power1 = Tile(Position({x = 32613, y = 32220, z = 10}))
	local barrel = Tile(Position({x = 32614, y = 32209, z = 10}))
	local wall = Tile(Position({x = 32614, y = 32205, z = 10}))
	local stone = Tile(Position({x = 32614, y = 32206, z = 10}))
	local burn1 = Tile(Position({x = 32613, y = 32220, z = 10}))
	local burn2 = Tile(Position({x = 32615, y = 32221, z = 10}))

	if item.itemid == 1945 and power1:getItemById(2166) and wall:getItemById(1025) and stone:getItemById(1304) and barrel:getItemById(1774) then
		power1:getItemById(2166):remove()
		wall:getItemById(1025):remove()
		stone:getItemById(1304):transform(1025)
		burn1:sendMagicEffect(CONST_ME_FIREAREA)
		burn2:sendMagicEffect(CONST_ME_FIREAREA)
	else
		Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
	end
	if item.itemid == 1946 then
		Item(item.uid):transform(1945)
	end
	return true
end
