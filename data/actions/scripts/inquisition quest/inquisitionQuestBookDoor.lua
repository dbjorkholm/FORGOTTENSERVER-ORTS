function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9016) then
		if(getPlayerStorageValue(cid, 200) >= 2) then
			if(item.itemid == 5105) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5106)
			end
		end
	end
	return true
end