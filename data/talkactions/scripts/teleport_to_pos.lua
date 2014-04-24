function onSay(cid, words, param, channel)

	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local tile = string.split(param, ",")
	local pos = {x = 0, y = 0, z = 0}

	if(tile[2] and tile[3]) then
		pos = {x = tile[1], y = tile[2], z = tile[3]}
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
		return true
	end


	local tmp = getCreaturePosition(cid)
	if(doTeleportThing(cid, pos, true) and not isPlayerGhost(cid)) then
		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return true
end
