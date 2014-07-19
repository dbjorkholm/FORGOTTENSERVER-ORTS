local config = {
	[50092] = Position(32600, 31504, 13),
	[50093] = Position(32604, 31338, 11),
	[50100] = Position(32566, 31505, 9)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end
	
	if player:getStorageValue(Storage.hiddenCityOfBeregar.OreWagon) == 1 then
		player:teleportTo(targetPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't know how to use this yet.")
	end
	return true
end
