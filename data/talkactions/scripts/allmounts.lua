function onSay(cid, words, param, channel)
local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	

	local pid = 0
	if(param == '') then
		pid = getCreatureTarget(cid)
		if(pid == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unlocks all mounts for certain player. Usage: /mounts Player Name")
			return false
		end
	else
		pid = getPlayerByName(param)
	end

	if(not pid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " is not currently online.")
		return false
	end
	
	if getPlayerAccountType(pid) > getPlayerAccountType(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cannot perform action.")
		return false
	end
	
	for i = 1, 47 do
        doPlayerAddMount(pid, i)
    end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "All mounts unlocked for " .. getCreatureName(pid) .. ".")
	doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[Server]: All mounts unlocked.")
return false
end
