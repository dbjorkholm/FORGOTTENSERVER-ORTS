function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3077) then
		if(getPlayerStorageValue(cid, 30) >= 17) then
			if(item.itemid == 1255) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end