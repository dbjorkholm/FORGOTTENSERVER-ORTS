function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 5390) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+2) == 1) then
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+2, 2)
			doPlayerAddItem(cid, 2346, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a tear of daraman.")
		end
	end
	return true
end