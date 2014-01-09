function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3083) then
		if(getPlayerStorageValue(cid, 30) >= 30) then
			if(item.itemid == 6259) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 6260)
			end
		end
	end
	return true
end