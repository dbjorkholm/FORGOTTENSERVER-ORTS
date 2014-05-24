function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9021) then
		if(getPlayerStorageValue(cid, 200) == 23) then
			return (doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You forgot to ask henricus for outfit."))
		end
		if(getPlayerStorageValue(cid, 200) >= 24) then
			if(item.itemid == 5105) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5106)
			end
		end
	end
	return true
end
