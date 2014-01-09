function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3117) then
		if(getPlayerStorageValue(cid, 250) >= 35) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end