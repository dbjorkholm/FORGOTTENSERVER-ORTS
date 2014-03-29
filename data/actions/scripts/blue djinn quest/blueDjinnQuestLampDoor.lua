function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3023) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) >= 2) then
			if(item.itemid == 1255) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end