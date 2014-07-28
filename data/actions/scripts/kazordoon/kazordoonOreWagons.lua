local gate = Position(32575, 31973, 9) -- Don't know if this is where you're supposed to end up?

local config = {
-- outside wagons --
	[50136] = Position(gate),
	[50137] = Position(gate),
	[50138] = Position(gate),
	[50139] = Position(gate),
-- kaz main gate wagons --
	[50140] = Position(32673, 31975, 15), -- Steamboat
	[50141] = Position(32625, 31921, 11), -- Temple
	[50142] = Position(32605, 31902, 9), -- Shops
	[50143] = Position(32654, 31902, 8), -- Depot
-- kaz temple wagons --
	[50144] = Position(32575, 31974, 9), -- Main gate
	[50145] = Position(32674, 31975, 15), -- Steamboat
	[50146] = Position(32605, 31907, 9), -- Shops
	[50147] = Position(32655, 31902, 8), -- Depot
-- kaz steamboat wagons --
	[50148] = Position(32575, 31977, 9), -- Main gate
	[50149] = Position(32626, 31921, 11), -- Temple
	[50150] = Position(32605, 31908, 9), -- Shops
	[50151] = Position(32660, 31902, 8), -- Depot
-- kaz depot wagons --
	[50152] = Position(32575, 31968, 9), -- Main gate
	[50153] = Position(32631, 31921, 11), -- Temple
	[50154] = Position(32605, 31903, 9), -- Shops
	[50155] = Position(32679, 31975, 15), -- Steamboat
-- kaz shop wagons --
	[50156] = Position(32678, 31975, 15), -- Steamboat
	[50157] = Position(32630, 31921, 11), -- Temple
	[50158] = Position(32659, 31902, 8), -- Depot
	[50159] = Position(32575, 31971, 9) -- Main gate
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
