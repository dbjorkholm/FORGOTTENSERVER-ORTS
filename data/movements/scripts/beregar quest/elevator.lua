local config = {
	[50094] = Position(32612, 31499, 15),
	[50095] = Position(32612, 31499, 14)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local teleport = config[item.actionid]
	if not teleport then
		return true
	end
	
	if player:getStorageValue(Storage.hiddenCityOfBeregar.GoingDown) == 2 then
		player:teleportTo(teleport)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't know how to use this yet.")
	end
	return true
end
