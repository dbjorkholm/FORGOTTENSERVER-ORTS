function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, STORAGE_ARENA) < 1 then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end
	if isInArray({ACTION_GREENHORNDOOR, ACTION_SCRAPPERDOOR, ACTION_WARLORDDOOR}, item.actionid) then
		if getPlayerStorageValue(cid, item.actionid) > 0 then
			if item.itemid == 5133 then return false end
                	doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
			return true
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's locked.")
		end
	else
		if (getPlayerStorageValue(cid, STORAGE_PIT) == 1) then
			if item.itemid == 5133 then return false end
                	doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end