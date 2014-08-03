local config = {
	{value = 9710, teleportPos = Position(32834, 32082, 7)},
	{value = 9711, teleportPos = Position(32680, 31720, 7)},
	{value = 9712, teleportPos = Position(32268, 32162, 7)},
	{value = 9713, teleportPos = Position(32263, 31847, 7)},
	{value = 9714, teleportPos = Position(33221, 31921, 7)},
	{value = 9716, teleportPos = Position(32574, 31981, 7)}
}

function onStepIn(cid, item, position)
	local player = Player(cid)
	if not player then
		return true
	end

	for i = 1, #config do
		local gate = config[i]
		if item.actionid == gate.value and Game.getStorageValue(gate.value) == 1 then
			if player:getLevel() >= 60 then
				player:teleportTo(Position(33290, 31786, 13))
				player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				player:teleportTo(gate.teleportPos)
			end
		elseif item.actionid == 9715 and Game.getStorageValue(gate.value) == 1 then
			player:teleportTo(gate.teleportPos)
			player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
		end
	end
	return true
end
