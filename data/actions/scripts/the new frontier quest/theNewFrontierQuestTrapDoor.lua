function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 8008) then
		if(getPlayerStorageValue(cid, 1015) == 22) then
			if(item.itemid == 10782) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end