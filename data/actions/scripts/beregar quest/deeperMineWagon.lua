local config = {
	[1] = Position(32566, 31505, 9),
	[2] = Position(32611, 31513, 9)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetPosition = config[player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue)]
	if not targetPosition then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't have permission to use this yet.")
		return true
	end

	player:teleportTo(targetPosition, true)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
