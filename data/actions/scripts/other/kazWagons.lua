local gate = Position(32575, 31973, 9) -- Don't know if this is where you're supposed to end up?

local config = {
-- outside wagons --
	[50130] = Position(gate),
	[50131] = Position(gate),
	[50132] = Position(gate),
	[50153] = Position(gate),
-- kaz main gate wagons --
	[50133] = Position(32673, 31975, 15), -- Steamboat
	[50134] = Position(32625, 31921, 11), -- Temple
	[50135] = Position(32605, 31902, 9), -- Shops
	[50136] = Position(32654, 31902, 8), -- Depot
-- kaz temple wagons --
	[50137] = Position(32575, 31974, 9), -- Main gate
	[50138] = Position(32674, 31975, 15), -- Steamboat
	[50139] = Position(32605, 31907, 9), -- Shops
	[50140] = Position(32655, 31902, 8), -- Depot
-- kaz steamboat wagons --
	[50141] = Position(32575, 31977, 9), -- Main gate
	[50142] = Position(32626, 31921, 11), -- Temple
	[50143] = Position(32605, 31908, 9), -- Shops
	[50144] = Position(32660, 31902, 8), -- Depot
-- kaz depot wagons --
	[50145] = Position(32575, 31968, 9), -- Main gate
	[50146] = Position(32631, 31921, 11), -- Temple
	[50147] = Position(32605, 31903, 9), -- Shops
	[50148] = Position(32679, 31975, 15), -- Steamboat
-- kaz shop wagons --
	[50149] = Position(32678, 31975, 15), -- Steamboat
	[50150] = Position(32630, 31921, 11), -- Temple
	[50151] = Position(32659, 31902, 8), -- Depot
	[50152] = Position(32575, 31971, 9) -- Main gate
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
