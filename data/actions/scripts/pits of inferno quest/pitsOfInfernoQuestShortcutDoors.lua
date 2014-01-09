function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 8818) then
		if(getPlayerStorageValue(cid, 8817) >= 1) then
			if(item.itemid == 5132) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end