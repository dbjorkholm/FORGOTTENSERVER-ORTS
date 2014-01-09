function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7813) then
		if(getPlayerStorageValue(cid, 121) >= 35) then
			if(item.itemid == 7040) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 7041)
			end
		end
	end
	return true
end