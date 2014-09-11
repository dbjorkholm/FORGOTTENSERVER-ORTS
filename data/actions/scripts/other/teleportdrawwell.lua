function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 1000 and itemEx.itemid == 1369 then
		fromPosition.z = fromPosition.z + 1
		Player(cid):teleportTo(fromPosition)
	end
	return TRUE
end