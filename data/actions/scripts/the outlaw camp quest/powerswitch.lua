function onUse(cid, item, fromPosition, itemEx, toPosition)

	local power1 = Tile(Position({x = 32594, y = 32214, z = 9}))
	local power2 = Tile(Position({x = 32613, y = 32220, z = 10}))
	local wall = Tile(Position({x=32604, y=32216, z=9}))

	if item.itemid == 1945 and power1:getItemById(2166) and wall:getItemById(1026) then
		power1:getItemById(2166):remove()
		wall:getItemById(1026):remove()
		Game.createItem(2166,1,power2)
		--FIXME:
		--event = addEvent(doCreateItem, 600000, 1026, 1, wallpos)
		--doSendMagicEffect(power, 8)
		power1:sendMagicEffect(CONST_ME_TELEPORT)
	else
		Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
	end
	if item.itemid == 1946 then
		Item(item.uid):transform(1945)
	end
	return true
end
