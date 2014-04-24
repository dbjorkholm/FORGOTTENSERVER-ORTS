function onSay(cid, words, param, channel)
local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
local looktypes = {128, 136, 129, 137, 130, 138, 131, 139, 132, 140, 133, 141, 134, 142, 143, 147, 144, 148, 145, 149, 146, 150, 151, 155, 152, 156, 153, 157, 154, 158, 251, 252, 268, 269, 273, 270, 278, 279, 289, 288, 325, 324, 335, 336, 366, 367, 328, 329, 430, 431, 432, 433, 463, 464, 465, 466, 471, 472, 512, 513, 514, 516, 541, 542, 574, 575, 577, 578}
if(not param) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Gives player ability to wear all addons, example: /addons Player Name")
end

	local pid = 0
	if(param == '') then
		pid = getCreatureTarget(cid)
		if(pid == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unlocks all addons for certain player. Usage: /addons Player Name")
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
	
	for i = 1, #looktypes do
	doPlayerAddOutfit(pid, looktypes[i], 3)
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "All addons unlocked for " .. getCreatureName(pid) .. ".")
	doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[Server]: All addons unlocked.")
	return false
end