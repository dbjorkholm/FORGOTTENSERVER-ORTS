function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 1004) then
		if(getPlayerStorageValue(cid, 200) == 18) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	end
	return true
end