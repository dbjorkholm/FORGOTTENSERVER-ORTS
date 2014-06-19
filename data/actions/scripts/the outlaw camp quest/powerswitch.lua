function onUse(cid, item, fromPosition, itemEx, toPosition)

	local wall = Tile(Position({x=32604, y=32216, z=9}))
	local power2pos = Position({x = 32613, y = 32220, z = 10})
	local power1pos = Position({x = 32594, y = 32214, z = 9})
	local power1 = power1pos:getTile()

	if item.itemid == 1945 and power1:getItemById(2166) and wall:getItemById(1026) then
		power1:getItemById(2166):remove()
		wall:getItemById(1026):remove()
		Game.createItem(2166,1,power2pos)
		--FIXME:
		--event = addEvent(doCreateItem, 600000, 1026, 1, wallpos)
		--doSendMagicEffect(power, 8)
		power1pos:sendMagicEffect(CONST_ME_TELEPORT)
	end
		Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
