function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 1000 and itemEx.itemid == 1369 then
		fromPosition.z = fromPosition.z + 1
		player:teleportTo(fromPosition)
	end
	return TRUE
end