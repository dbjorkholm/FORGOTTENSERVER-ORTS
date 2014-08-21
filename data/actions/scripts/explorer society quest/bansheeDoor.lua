function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3013) then
		if(getPlayerStorageValue(cid, 90) >= 49) then
			if(item.itemid == 1225) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1226)
			end
		end
	end
	return true
end