function checkArea(fromPosition, toPosition)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature then
					return false
				end
			end
		end
	end

	return true
end

function clearBossRoom(cid, bossId, fromPosition, toPosition, exitPosition)
	local player = Player(cid)
	if player and isInRange(player:getPosition(), fromPosition, toPosition) then
		player:teleportTo(exitPosition)
		exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	local boss = Monster(bossId)
	if boss then
		boss:remove()
	end
end

local bosses = {
	[3230] = {bossName = 'the snapper', storage = 35000, playerPosition = Position(32610, 32723, 8), bossPosition = Position(32617, 32732, 8), fromPosition = Position(32607, 32720, 8), toPosition = Position(32621, 32734, 8), flamePosition = Position(32612, 32733, 8)},
	[3231] = {bossName = 'hide', storage = 35001, playerPosition = Position(32815, 32703, 8), bossPosition = Position(32816, 32712, 8), fromPosition = Position(32809, 32701, 8), toPosition = Position(32823, 32713, 8), flamePosition = Position(32810, 32704, 8)},
	[3232] = {bossName = 'deathbine', storage = 35002, playerPosition = Position(32715, 32736, 8), bossPosition = Position(32714, 32713, 8), fromPosition = Position(32702, 32710, 8), toPosition = Position(32728, 32738, 8), flamePosition = Position(32726, 32727, 8)},
	[3233] = {bossName = 'the bloodtusk', storage = 35003, playerPosition = Position(32102, 31124, 2), bossPosition = Position(32102, 31134, 2), fromPosition = Position(32091, 31120, 2), toPosition = Position(32106, 31134, 2), flamePosition = Position(32093, 31130, 2)},
	[3234] = {bossName = 'shardhead', storage = 35004, playerPosition = Position(32150, 31137, 3), bossPosition = Position(32159, 31132, 3), fromPosition = Position(32146, 31126, 3), toPosition = Position(32161, 31143, 3), flamePosition = Position(32149, 31137, 3)},
	[3235] = {bossName = 'esmeralda', storage = 35005, playerPosition = Position(32759, 31252, 9), bossPosition = Position(32759, 31258, 9), fromPosition = Position(32755, 31250, 9), toPosition = Position(32764, 31259, 9), flamePosition = Position(32758, 31248, 9)},
	[3236] = {bossName = 'fleshcrawler', storage = 35006, playerPosition = Position(33100, 32785, 11), bossPosition = Position(33121, 32797, 11), fromPosition = Position(33091, 32773, 11), toPosition = Position(33129, 32809, 11), flamePosition = Position(33106, 32775, 11)},
	[3237] = {bossName = 'ribstride', storage = 35007, playerPosition = Position(33012, 32813, 13), bossPosition = Position(33013, 32801, 13), fromPosition = Position(33000, 32793, 13), toPosition = Position(33024, 32818, 13), flamePosition = Position(33018, 32814, 13)},
	[3238] = {bossName = 'bloodweb', storage = 35008, playerPosition = Position(32019, 31037, 8), bossPosition = Position(32032, 31033, 8), fromPosition = Position(32003, 31014, 8), toPosition = Position(32040, 31047, 8), flamePosition = Position(32010, 31031, 8)},
	[3239] = {bossName = 'thul', storage = 35009, playerPosition = Position(32078, 32780, 13), bossPosition = Position(32088, 32780, 13), fromPosition = Position(32075, 32773, 13), toPosition = Position(32089, 32789, 13), flamePosition = Position(32086, 32776, 13)},
	[3240] = {bossName = 'the old widow', storage = 35010, playerPosition = Position(32805, 32280, 8), bossPosition = Position(32797, 32281, 8), fromPosition = Position(32793, 32273, 8), toPosition = Position(32807, 32288, 8), flamePosition = Position(32808, 32283, 8)},
	[3241] = {bossName = 'hemming', storage = 35011, playerPosition = Position(32999, 31452, 8), bossPosition = Position(33013, 31441, 8), fromPosition = Position(32992, 31435, 8), toPosition = Position(33017, 31456, 8), flamePosition = Position(33005, 31437, 8)},
	[3242] = {bossName = 'tormentor', storage = 35012, playerPosition = Position(32043, 31258, 11), bossPosition = Position(32058, 31267, 11), fromPosition = Position(32036, 31246, 11), toPosition = Position(32060, 31280, 11), flamePosition = Position(32051, 31249, 11)},
	[3243] = {bossName = 'flameborn', storage = 35013, playerPosition = Position(32940, 31064, 8), bossPosition = Position(32947, 31058, 8), fromPosition = Position(32928, 31052, 8), toPosition = Position(32960, 31073, 8), flamePosition = Position(32818, 31026, 7)},
	[3244] = {bossName = 'fazzrah', storage = 35014, playerPosition = Position(32990, 31171, 7), bossPosition = Position(33005, 31174, 7), fromPosition = Position(32987, 31167, 7), toPosition = Position(33019, 31185, 7), flamePosition = Position(33007, 31171, 7)},
	[3245] = {bossName = 'tromphonyte', storage = 35015, playerPosition = Position(33111, 31184, 8), bossPosition = Position(33120, 31195, 8), fromPosition = Position(33096, 31164, 8), toPosition = Position(33127, 31208, 8), flamePosition = Position(33109, 31168, 8)},
	[3246] = {bossName = 'sulphur scuttler', storage = 35016, playerPosition = Position(33269, 31046, 9), bossPosition = Position(33274, 31037, 9), fromPosition = Position(33264, 31032, 9), toPosition = Position(33286, 31044, 9), flamePosition = Position(0, 0, 0)},
-- missing map?	[3247] = {bossName = 'bruise payne', storage = 35017, playerPosition = Position(0, 0, 0), bossPosition = Position(0, 0, 0), fromPosition = Position(0, 0, 0), toPosition = Position(0, 0, 0 ), flamePosition = Position(0, 0, 0)},
	[3248] = {bossName = 'the many', storage = 35018, playerPosition = Position(32921, 32893, 8), bossPosition = Position(32926, 32903, 8), fromPosition = Position(32915, 32891, 8), toPosition = Position(32927, 32904, 8), flamePosition = Position(32921, 32890, 8)},
	[3249] = {bossName = 'the noxious spawn', storage = 35019, playerPosition = Position(32842, 32667, 11), bossPosition = Position(32843, 32675, 11), fromPosition = Position(32837, 32666, 11), toPosition = Position(32848, 32676, 11), flamePosition = Position(0, 0, 0)},
	[3250] = {bossName = 'gorgo', storage = 35020, playerPosition = Position(32759, 32447, 11), bossPosition = Position(32763, 32435, 11), fromPosition = Position(32747, 32428, 11), toPosition = Position(32769, 32451, 11), flamePosition = Position(32768, 32440, 11)},
	[3251] = {bossName = 'stonecracker', storage = 35021, playerPosition = Position(33259, 31694, 15), bossPosition = Position(33257, 31705, 15), fromPosition = Position(33251, 31691, 15), toPosition = Position(33267, 31712, 15), flamePosition = Position(33259, 31689, 15)},
	[3252] = {bossName = 'leviathan', storage = 35022, playerPosition = Position(31915, 31071, 10), bossPosition = Position(31903, 31072, 10), fromPosition = Position(31899, 31064, 10), toPosition = Position(31917, 31081, 10), flamePosition = Position(31918, 31071, 10)},
	[3253] = {bossName = 'kerberos', storage = 35023, playerPosition = Position(32048, 32581, 15), bossPosition = Position(32032, 32565, 15), fromPosition = Position(32027, 32555, 15), toPosition = Position(32052, 32585, 15), flamePosition = Position(32030, 32555, 15)},
	[3254] = {bossName = 'ethershreck', storage = 35024, playerPosition = Position(33089, 31021, 8), bossPosition = Position(33085, 31004, 8), fromPosition = Position(33073, 31000, 8), toPosition = Position(33100, 31026, 8), flamePosition = Position(33076, 31007, 8)},
	[3255] = {bossName = 'paiz the pauperizer', storage = 35025, playerPosition = Position(33069, 31110, 1), bossPosition = Position(33082, 31105, 1), fromPosition = Position(33067, 31103, 1), toPosition = Position(33084, 31116, 1), flamePosition = Position(33076, 31110, 1)},
	[3256] = {bossName = 'bretzecutioner', storage = 35026, playerPosition = Position(31973, 31184, 10), bossPosition = Position(31979, 31176, 10), fromPosition = Position(31954, 31163, 10), toPosition = Position(31987, 31190, 10), flamePosition = Position(31973, 31166, 10)},
	[3257] = {bossName = 'zanakeph', storage = 35027, playerPosition = Position(33077, 31040, 12), bossPosition = Position(33082, 31056, 12), fromPosition = Position(33059, 31039, 12), toPosition = Position(33093, 31064, 12), flamePosition = Position(33070, 31039, 12)},
	[17521] = {bossName = 'necropharus', storage = 17521, playerPosition = Position(33028, 32426, 12), bossPosition = Position(33026, 32422, 12), fromPosition = Position(33017, 32415, 12), toPosition = Position(33036, 32432, 12), flamePosition = Position(33070, 31035, 12)},
	[17522] = {bossName = 'the horned fox', storage = 17522, playerPosition = Position(32458, 31994, 9), bossPosition = Position(32458, 32005, 9), fromPosition = Position(32449, 31991, 9), toPosition = Position(32466, 32010, 9), flamePosition = Position(33070, 31029, 12)},
	[3258] = {bossName = 'demodras', storage = Storage.KillingInTheNameOf.DemodrasTeleport, playerPosition = Position(32748, 32287, 10), bossPosition = Position(32747, 32294, 10), fromPosition = Position(32738, 32285, 10), toPosition = Position(32757, 32300, 10), flamePosition = Position(33076, 31029, 12)},
	[3259] = {bossName = 'tiquandas revenge', storage = Storage.KillingInTheNameOf.TiquandasRevengeTeleport, playerPosition = Position(32888, 32580, 4), bossPosition = Position(32888, 32586, 4), fromPosition = Position(32877, 32573, 4), toPosition = Position(32892, 32587, 4), flamePosition = Position(33076, 31029, 11)},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if player:getStorageValue(boss.storage) ~= 1 or not checkArea(boss.fromPosition, boss.toPosition) then
		player:teleportTo(fromPosition)
		return true
	end

	player:setStorageValue(boss.storage, 0)
	player:teleportTo(boss.playerPosition)
	boss.playerPosition:sendMagicEffect(CONST_ME_TELEPORT)

	local monster = Game.createMonster(boss.bossName, boss.bossPosition)
	addEvent(clearBossRoom, 60 * 10 * 1000, cid, monster:getId(), boss.fromPosition, boss.toPosition, fromPosition)
	player:say('You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	return true
end
