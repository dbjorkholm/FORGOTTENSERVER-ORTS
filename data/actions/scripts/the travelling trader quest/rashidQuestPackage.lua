dofile('data/lib/MissionSelect.lua')
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3020) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart + 1) == 3) then
			setPlayerStorageValue(cid, Rashid.MissionStart + 1, 4)
			doPlayerAddItem(cid, 7503, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a heavy package.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end