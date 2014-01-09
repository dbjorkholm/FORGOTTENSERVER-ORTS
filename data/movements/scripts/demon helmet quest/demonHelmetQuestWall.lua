local pos = {
	{x = 33190, y = 31629, z = 13, stackpos = 255},
	{x = 33191, y = 31629, z = 13, stackpos = 255}
}

local wall = {
	{x = 33210, y = 31630, z = 13},
	{x = 33211, y = 31630, z = 13},
	{x = 33212, y = 31630, z = 13}
}

function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 980) then
		for i = 1, 2 do
			if(not(isPlayer(getThingfromPos(pos[i]).uid))) then
				return true
			end
		end
		for i = 1, 3 do
			doRemoveItem(getTileItemById(wall[i], 1050).uid, 1)
			addEvent(doCreateItem, 10 * 60 * 1000, 1050, 1, wall[i])
		end
	end
	return true
end