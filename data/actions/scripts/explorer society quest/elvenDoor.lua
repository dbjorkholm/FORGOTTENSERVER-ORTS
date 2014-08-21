function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3008) then
		if(getPlayerStorageValue(cid, 90) >= 36) then
			if(item.itemid == 1223) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1224)
			end
		end
	end
	return true
end