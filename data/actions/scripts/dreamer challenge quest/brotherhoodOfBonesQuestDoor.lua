function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3044) then
		if(getPlayerStorageValue(cid, 67) >= 4) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	end
	return true
end