function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3006) then
		if(getPlayerStorageValue(cid, 90) >= 33) then
			if(item.itemid == 6261) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 6260)
			end
		end
	end
	return true
end