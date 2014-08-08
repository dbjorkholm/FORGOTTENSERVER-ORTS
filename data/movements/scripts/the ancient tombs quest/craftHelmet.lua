local helmetIds = {2335, 2336, 2337, 2338, 2339, 2340, 2341}

function onAddItem(moveitem, tileitem, position)
	if not isInArray(helmetIds, moveitem.itemid) then
		return true
	end

	local tile, helmetItems = Tile(position), {}
	local helmetItem
	for i = 1, #helmetIds do
		helmetItem = tile:getItemById(helmetIds[i])
		if not helmetItem then
			return true
		end
		table.insert(helmetItems, helmetItem)
	end

	for i = 1, #helmetItems do
		helmetItems[i]:remove()
	end

	Game.createItem(2342, 1, position)
	position:sendMagicEffect(CONST_ME_FIREAREA)
	return true
end