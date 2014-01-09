function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3305) then
		if(getPlayerStorageValue(cid, 8816) >= 1) then
			if(item.itemid == 1223) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end