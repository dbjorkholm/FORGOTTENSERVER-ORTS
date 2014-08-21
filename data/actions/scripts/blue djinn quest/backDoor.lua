function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3022) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+2) >= 1) then
			if(item.itemid == 1255) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end