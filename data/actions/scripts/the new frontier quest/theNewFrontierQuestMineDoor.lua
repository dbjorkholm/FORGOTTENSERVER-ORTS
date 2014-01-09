function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 8005) then
		if(getPlayerStorageValue(cid, 1015) >= 12) then
			if(item.itemid == 8553) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end