function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7807) then
		if(getPlayerStorageValue(cid, 30) >= 51) then
			if(item.itemid == 1257) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1258)
			end
		end
	end
	return true
end