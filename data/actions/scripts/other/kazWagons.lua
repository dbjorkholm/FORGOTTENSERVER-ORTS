local gate = Position(32575, 31973, 9) -- Don't know if this is where you're supposed to end up?

local config = {
-- outside wagons --
	[] = Position(gate),
	[] = Position(gate),
	[] = Position(gate),
-- kaz main gate wagons --
	[] = Position(32673, 31975, 15), -- Steamboat
	[] = Position(32625, 31921, 11), -- Temple
	[] = Position(32605, 31902, 9), -- Shops
	[] = Position(32654, 31902, 8), -- Depot
-- kaz temple wagons --
	[] = Position(32575, 31974, 9), -- Main gate
	[] = Position(32674, 31975, 15), -- Steamboat
	[] = Position(32605, 31907, 9), -- Shops
	[] = Position(32655, 31902, 8), -- Depot
-- kaz steamboat wagons --
	[] = Position(32575, 31977, 9), -- Main gate
	[] = Position(32626, 31921, 11), -- Temple
	[] = Position(32605, 31908, 9), -- Shops
	[] = Position(32660, 31902, 8), -- Depot
-- kaz depot wagons --
	[] = Position(32575, 31968, 9), -- Main gate
	[] = Position(32631, 31921, 11), -- Temple
	[] = Position(32605, 31903, 9), -- Shops
	[] = Position(32679, 31975, 15), -- Steamboat
-- kaz shop wagons --
	[] = Position(32678, 31975, 15), -- Steamboat
	[] = Position(32630, 31921, 11), -- Temple
	[] = Position(32659, 31902, 8), -- Depot
	[] = Position(32575, 31971, 9) -- Main gate
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.wagon.Ticket) >= os.time() then
		player:teleportTo(targetPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You need a wagon ticket to use this.")
	end
	return true
end
