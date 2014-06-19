function onUse(cid, item, fromPosition, itemEx, toPosition)

	local oven1 = Tile(Position({x = 32623, y = 32188, z = 9}))
	local oven2 = Tile(Position({x=32623, y=32189, z=9}))
	local oven1pos = oven1:getPosition()
	local oven2pos = oven2:getPosition()

	if item.itemid == 1945 and oven1:getItemById(1787) then
		oven1:getItemById(1787):remove()
		Game.createItem(1787,1,oven2pos)
	elseif item.itemid == 1945 and oven1:getItemById(1786) then
		oven1:getItemById(1786):remove()
		Game.createItem(1786,1,oven2pos)
	elseif item.itemid == 1946 and oven2:getItemById(1787) then
		oven2:getItemById(1787):remove()
		Game.createItem(1787,1,oven1pos)
	elseif item.itemid == 1946 and oven2:getItemById(1786) then
		oven2:getItemById(1786):remove()
		Game.createItem(1786,1,oven1pos)
	else
		Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
