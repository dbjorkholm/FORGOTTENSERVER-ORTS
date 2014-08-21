function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.actionid == 5390) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+2) == 1) then
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+2, 2)
			doPlayerAddItem(cid, 2346, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a tear of daraman.")
		end
	end
	return true
end
