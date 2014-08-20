local config = {
-- outside wagons --
	[50136] = Position(32618, 31899, 9),
	[50137] = Position(32620, 31899, 9),
	[50138] = Position(32614, 31899, 9),
	[50139] = Position(32616, 31899, 9),
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
	[50159] = Position(32575, 31971, 9), -- Main gate
-- inside to outside wagons --
	[50230] = Position(32600, 31875, 7), -- Kazordoon Surface North
	[50231] = Position(32577, 31929, 0), -- Colossus Top
	[50232] = Position(32619, 31944, 7), -- Kazordoon Surface South
	[50233] = Position(32553, 31930, 7)  -- Kazordoon Surface West

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.wagonTicket) < os.time() then
		player:say("Purchase a weekly ticket from Gewen, Lokur in the post office, The Lukosch brothers or from Brodrosch on the steamboat.", TALKTYPE_MONSTER_SAY)
		return true
	end
	
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
