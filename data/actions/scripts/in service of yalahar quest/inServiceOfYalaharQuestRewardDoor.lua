function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7811) then
		if(getPlayerStorageValue(cid, 30) >= 53) then
			if(item.itemid == 1255) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end