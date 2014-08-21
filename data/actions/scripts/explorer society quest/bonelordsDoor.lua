function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3004) then
		if(getPlayerStorageValue(cid, 90) >= 30) then
			if(item.itemid == 5105) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5106)
			end
		end
	end
	return true
end