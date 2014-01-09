function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3153) then
		if(getPlayerStorageValue(cid, 1004) >= 7) then
			if(item.itemid == 6261) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end