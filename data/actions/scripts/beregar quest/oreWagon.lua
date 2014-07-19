local config = {
	[50092] = Position(32600, 31504, 13),
	[50093] = Position(32604, 31338, 11)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	local targetItem = config[item.actionid]
	if not targetItem then
		return true
	end
	
	player:teleportTo(targetItem)
	return true
end
