function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3066) then
		if(getPlayerStorageValue(cid, 47) == 1) then
			if(item.itemid == 5132) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5133)
			end
		end
	end
	return true
end