function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7805) then
		if(getPlayerStorageValue(cid, 30) >= 45) then
			if(item.itemid == 9277) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9278)
			elseif(item.itemid == 9279) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end