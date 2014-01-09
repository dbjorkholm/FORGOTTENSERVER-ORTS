function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7806) then
		if(getPlayerStorageValue(cid, 678) >= 1) then
			if(item.itemid == 9279) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end