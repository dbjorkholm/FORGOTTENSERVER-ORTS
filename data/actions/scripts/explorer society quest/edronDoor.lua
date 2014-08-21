function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3011) then
		if(getPlayerStorageValue(cid, 90) >= 39) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	end
	return true
end