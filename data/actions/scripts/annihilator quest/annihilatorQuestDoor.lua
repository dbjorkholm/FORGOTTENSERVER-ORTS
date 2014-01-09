function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2216) then
		if(getPlayerStorageValue(cid, 2215) < 1) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	end
	return true
end