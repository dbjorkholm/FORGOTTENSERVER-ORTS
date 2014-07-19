local config = {
	[9710] = Position(32834, 32082, 7),
	[9711] = Position(32680, 31720, 7),
	[9712] = Position(32268, 32162, 7),
	[9713] = Position(32263, 31847, 7),
	[9714] = Position(33221, 31921, 7),
	[9716] = Position(32574, 31981, 7)
}

function onStepIn(cid, item, position)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local gate = config[item.actionid]
	if item.actionid == gate and Game.getStorageValue(gate) == 1 then
		if player:getLevel() >= 60 then
			player:teleportTo(Position(33290, 31786, 13))
			player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:teleportTo(gate)
		end
	elseif item.actionid == 9715 and Game.getStorageValue(gate) == 1 then
		player:teleportTo(gate)
		player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	end
	return true
end
