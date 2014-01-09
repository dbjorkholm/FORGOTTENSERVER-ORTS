function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "wiggler") then
		if(getPlayerStorageValue(cid, 937) < 7 and getPlayerStorageValue(cid, 936) == 1) then
			setPlayerStorageValue(cid, 937, getPlayerStorageValue(cid, 937) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You killed " .. getPlayerStorageValue(cid, 937) .. " of 10 wigglers.")
		end
	end
	return true
end