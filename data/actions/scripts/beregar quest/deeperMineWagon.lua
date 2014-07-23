local wagons = {
	{storage = Storage.hiddenCityOfBeregar.RoyalRescue, value = 1, teleportPos = Position(32566, 31505, 9)}
	{storage = Storage.hiddenCityOfBeregar.RoyalRescue, value = 2, teleportPos = Position(32611, 31513, 9)}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	for i = 1, #wagons do
		if player:getStorageValue(wagons[i].storage) == wagons[i].value then
			player:teleportTo(wagons[i].teleportPos, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't have permission to use this yet.")
		end
	end
	return true
end
