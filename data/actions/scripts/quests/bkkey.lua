local config = {
	storage = 9196,
	key_id = 2088, -- Key ID
	key_aid = 5010
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, config.storage) < 1) then
		local key = doCreateItemEx(config.key_id, 1)
		doSetItemActionId(key, config.key_aid)
		if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a key.")
			setPlayerStorageValue(cid, config.storage, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getPlayerFreeCap(cid) < getItemWeight(key) and "You have found a key. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a key, but you have no room to take it.")
		end
	else
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead tree is empty.")
	end
	return true
end