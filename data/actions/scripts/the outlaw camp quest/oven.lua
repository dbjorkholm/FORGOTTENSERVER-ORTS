function onUse(cid, item, fromPosition, itemEx, toPosition)

	local oven1 = Tile(Position({x = 32623, y = 32188, z = 9}))
	local oven2 = Tile(Position({x=32623, y=32189, z=9}))

	if item.itemid == 1945 and oven1:getItemById(1787) then
		oven1:getItemById(1787):remove()
		Game.createItem(1787,1,oven2)
	elseif item.itemid == 1945 and oven1:getItemById(1786) then
		oven1:getItemById(1786):remove()
		Game.createItem(1786,1,oven2)
	elseif item.itemid == 1946 and oven2:getItemById(1787) then
		oven2:getItemById(1787):remove()
		Game.createItem(1787,1,oven1)
	elseif item.itemid == 1946 and oven2:getItemById(1786) then
		oven2:getItemById(1786):remove()
		Game.createItem(1786,1,oven1)
	else
		Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
	end
	return true
end
