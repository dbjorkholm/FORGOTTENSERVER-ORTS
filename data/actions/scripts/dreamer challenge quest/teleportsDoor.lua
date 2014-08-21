function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 9054) then
		if(getPlayerStorageValue(cid, 66) >= 1 or getPlayerStorageValue(cid, 67) >= 1) then
			if(item.itemid == 1225) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1226)
			end
		end
	end
	return true
end