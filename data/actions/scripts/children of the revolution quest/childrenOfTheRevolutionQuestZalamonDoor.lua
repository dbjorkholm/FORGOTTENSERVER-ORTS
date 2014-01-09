function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3170) then
		if(getPlayerStorageValue(cid, 1015) >= 24) then
			if(item.itemid == 10791) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 10792)
			end
		end
	end
	return true
end