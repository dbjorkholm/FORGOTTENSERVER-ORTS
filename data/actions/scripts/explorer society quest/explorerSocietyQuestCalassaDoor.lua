function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3113) then
		if(getPlayerStorageValue(cid, 90) >= 63) then
			if(item.itemid == 5748) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5749)
			end
		end
	end
	return true
end