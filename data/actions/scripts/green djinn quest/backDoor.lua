function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3025) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+2) >= 1) then
			if(item.itemid == 1257) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1258)
			end
		end
	end
	return true
end