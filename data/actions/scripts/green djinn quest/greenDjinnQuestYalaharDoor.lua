function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 3026) then
		if(getPlayerStorageValue(cid, 81) >= 12) then
			if(item.itemid == 1257) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1258)
			end
		end
	end
	return true
end