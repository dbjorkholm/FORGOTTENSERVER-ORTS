function doCheckArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				if(getTopCreature({x = x, y = y, z = z}).uid > 0) then
					return true
				end
			end
		end
	end
	return false
end

function removeSummon(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = toPos.z, toPos.z do
				if(getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
					if(isMonster(getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid)) then
						doRemoveCreature(getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid)
					end
				end
			end
		end
	end
	return true
end

function removePlayer(fromPos, toPos, lastPosition, cid)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = toPos.z, toPos.z do
				if(getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
					if(isPlayer(getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid)) then
							doTeleportThing(cid, lastPosition)
							doSendMagicEffect(lastPosition, CONST_ME_TELEPORT)
							doCreatureSay(cid, "Kicked out." , TALKTYPE_ORANGE_1)
					end
				end
			end
		end
	end
	return true
end

function fireOfLife(pos, time)
	fire = getTileThingByPos(pos).uid
	doSetItemSpecialDescription(fire, "")
	if(time > 0) then
		return addEvent(fireOfLife, 1000, pos, time)
	end
	return true
end

local bosses = {
-- no tp	[3230] = {bossName = "the snapper", storage = 35000, playerPos = {x = 32610, y = 32723, z = 8}, bossPos = {x = 32617, y = 32732, z = 8 },  fromPos = {x = 32607, y = 32720, z = 8 }, toPos = {x = 32621, y = 32734, z = 8 }, flamePos = {x = 32612, y = 32733, z = 8}},
	[3231] = {bossName = "hide", storage = 35001, playerPos = {x = 32815, y = 32703, z = 8}, bossPos = {x = 32816, y = 32712, z = 8 },  fromPos = {x = 32809, y = 32701, z = 8}, toPos = {x = 32823, y = 32713, z = 8}, flamePos = {x = 32810, y = 32704, z = 8}},
	[3232] = {bossName = "deathbine", storage = 35002, playerPos = {x = 32715, y = 32736, z = 8}, bossPos = {x = 32714, y = 32713, z = 8 },  fromPos = {x = 32702, y = 32710, z = 8 }, toPos = {x = 32728, y = 32738, z = 8 }, flamePos = {x = 32726, y = 32727, z = 8}},
--tp out wrong pos only 1sqm	[3233] = {bossName = "the bloodtusk", storage = 35003, playerPos = {x = 32102, y = 31124, z = 2}, bossPos = {x = 32102, y = 31134, z = 2 },  fromPos = {x = 32091, y = 31120, z = 2 }, toPos = {x = 32106, y = 31134, z = 2 }, flamePos = {x = 32093, y = 31130, z = 2}},
	[3234] = {bossName = "shardhead", storage = 35004, playerPos = {x = 32150, y = 31137, z = 3}, bossPos = {x = 32159, y = 31132, z = 3 },  fromPos = {x = 32146, y = 31126, z = 3 }, toPos = {x = 32161, y = 31143, z = 3 }, flamePos = {x = 32149, y = 31137, z = 3}},
	[3235] = {bossName = "esmeralda", storage = 35005, playerPos = {x = 32759, y = 31252, z = 9}, bossPos = {x = 32759, y = 31258, z = 9},  fromPos = {x = 32755, y = 31250, z = 9 }, toPos = {x = 32764, y = 31259, z = 9 }, flamePos = {x = 32758, y = 31248, z = 9}},
--missing map	[3236] = {bossName = "fleshcrawler 	", storage = 35006, playerPos = {x = 33100, y = 32785, z = 11}, bossPos = {x = 32121, y = 32797, z = 11 },  fromPos = {x = 33091, y = 32773, z = 11 }, toPos = {x = 33129, y = 32809, z = 11 }, flamePos = {x = 33106, y = 32775, z = 11}},
	[3237] = {bossName = "ribstride", storage = 35007, playerPos = {x = 33012, y = 32813, z = 13}, bossPos = {x = 33013, y = 32801, z = 13 },  fromPos = {x = 33000, y = 32793, z = 13 }, toPos = {x = 33024, y = 32818, z = 13 }, flamePos = {x = 33018, y = 32814, z = 13}},
--missing map	[3238] = {bossName = "bloodweb", storage = 35008, playerPos = {x = 32019, y = 31038, z = 8}, bossPos = {x = 32032, y = 31033, z = 8 },  fromPos = {x = 32003, y = 31014, z = 8 }, toPos = {x = 32040, y = 31047, z = 8 }, flamePos = {x = 32010, y = 31031, z = 8}},
	[3239] = {bossName = "thul", storage = 35009, playerPos = {x = 32078, y = 32780, z = 13}, bossPos = {x = 32088, y = 32780, z = 13 },  fromPos = {x = 32075, y = 32773, z = 13 }, toPos = {x = 32089, y = 32789, z = 13 }, flamePos = {x = 32086, y = 32776, z = 13}},
	[3240] = {bossName = "the old widow", storage = 35010, playerPos = {x = 32805, y = 32280, z = 8}, bossPos = {x = 32797, y = 32281, z = 8 },  fromPos = {x = 32793, y = 32273, z = 8 }, toPos = {x = 32807, y = 32288, z = 8 }, flamePos = {x = 32808, y = 32283, z = 8}},
	[3241] = {bossName = "hemming", storage = 35011, playerPos = {x = 32999, y = 31452, z = 8}, bossPos = {x = 33013, y = 31441, z = 8 },  fromPos = {x = 32992, y = 31435, z = 8 }, toPos = {x = 33017, y = 31456, z = 8 }, flamePos = {x = 33005, y = 31437, z = 8}},
	[3242] = {bossName = "tormentor", storage = 35012, playerPos = {x = 32043, y = 31258, z = 11}, bossPos = {x = 32058, y = 31267, z = 11 },  fromPos = {x = 32036, y = 31246, z = 11 }, toPos = {x = 32060, y = 31280, z = 11 }, flamePos = {x = 32051, y = 31249, z = 11}},
-- no tp	[3243] = {bossName = "flameborn", storage = 35013, playerPos = {x = 32940, y = 31064, z = 8}, bossPos = {x = 32947, y = 31058, z = 8},  fromPos = {x = 32928, y = 31052, z = 8 }, toPos = {x = 32960, y = 31073, z = 8 }, flamePos = {x = 32818, y = 31026, z = 7}},
	[3244] = {bossName = "fazzrah", storage = 35014, playerPos = {x = 32990, y = 31171, z = 7}, bossPos = {x = 33005, y = 31174, z = 7 },  fromPos = {x = 32987, y = 31167, z = 7 }, toPos = {x = 33019, y = 31185, z = 7 }, flamePos = {x = 33007, y = 31171, z = 7}},
	[3245] = {bossName = "tromphonyte", storage = 35015, playerPos = {x = 33111, y = 31184, z = 8}, bossPos = {x = 33120, y = 31195, z = 8 },  fromPos = {x = 33096, y = 31164, z = 8 }, toPos = {x = 33127, y = 31208, z = 8 }, flamePos = {x = 33109, y = 31168, z = 8}},
-- no tp	[3246] = {bossName = "sulphur scuttler", storage = 35016, playerPos = {x = 33269, y = 31046, z = 9}, bossPos = {x = 33274, y = 31037, z = 9 },  fromPos = {x = 33264, y = 31032, z = 9 }, toPos = {x = 33286, y = 31044, z = 9 }, flamePos = {x = 0, y = 0, z = 0}},
-- missing map?	[3247] = {bossName = "bruise payne", storage = 35017, playerPos = {x = 0, y = 0, z = 0}, bossPos = {x = 0, y = 0, z = 0 },  fromPos = {x = 0, y = 0, z = 0 }, toPos = {x = 0, y = 0, z = 0 }, flamePos = {x = 0, y = 0, z = 0}},
	[3248] = {bossName = "the many", storage = 35018, playerPos = {x = 32921, y = 32893, z = 8}, bossPos = {x = 32926, y = 32903, z = 8 },  fromPos = {x = 32915, y = 32891, z = 8 }, toPos = {x = 32927, y = 32904, z = 8}, flamePos = {x = 32921, y = 32890, z = 8}},
	[3249] = {bossName = "the noxious spawn", storage = 35019, playerPos = {x = 32842, y = 32667, z = 11}, bossPos = {x = 32843, y = 32675, z = 11}, fromPos = {x = 32837, y = 32666, z = 11}, toPos = {x = 32848, y = 32676, z = 11 }, flamePos = {x = 0, y = 0, z = 0}},
	[3250] = {bossName = "gorgo", storage = 35020, playerPos = {x = 32759, y = 32447, z = 11}, bossPos = {x = 32763, y = 32435, z = 11 },  fromPos = {x = 32747, y = 32428, z = 11 }, toPos = {x = 32769, y = 32451, z = 11 }, flamePos = {x = 32768, y = 32440, z = 11}},
	[3251] = {bossName = "stonecracker", storage = 35201, playerPos = {x = 33259, y = 31694, z = 15}, bossPos = {x = 33257, y = 31705, z = 15 },  fromPos = {x = 33251, y = 31691, z = 15 }, toPos = {x = 33267, y = 31712, z = 15 }, flamePos = {x = 33259, y = 31689, z = 15}},
	[3252] = {bossName = "leviathan", storage = 35022, playerPos = {x = 31915, y = 31071, z = 10}, bossPos = {x = 31903, y = 31072, z = 10 },  fromPos = {x = 31899, y = 31064, z = 10 }, toPos = {x = 31917, y = 31081, z = 10 }, flamePos = {x = 31918, y = 31071, z = 10}},
	[3253] = {bossName = "kerberos", storage = 35023, playerPos = {x = 32048, y = 32581, z = 15}, bossPos = {x = 32032, y = 32565, z = 15 },  fromPos = {x = 32027, y = 32555, z = 15 }, toPos = {x = 32052, y = 32585, z = 15 }, flamePos = {x = 32030, y = 32555, z = 15}},
	[3254] = {bossName = "ethershreck", storage = 35024, playerPos = {x = 33089, y = 31021, z = 8}, bossPos = {x = 33085, y = 31004, z = 8 },  fromPos = {x = 33073, y = 31000, z = 8 }, toPos = {x = 33100, y = 31026, z = 8 }, flamePos = {x = 33076, y = 31007, z = 8}},
	[3255] = {bossName = "paiz the pauperizer", storage = 35025, playerPos = {x = 33069, y = 31110, z = 1}, bossPos = {x = 33082, y = 31105, z = 1 },  fromPos = {x = 33067, y = 31103, z = 1 }, toPos = {x = 33084, y = 31116, z = 1 }, flamePos = {x = 33076, y = 31110, z = 1}},
	[3256] = {bossName = "bretzecutioner", storage = 35026, playerPos = {x = 31973, y = 31184, z = 10}, bossPos = {x = 31979, y = 31176, z = 10 },  fromPos = {x = 31954, y = 31163, z = 10 }, toPos = {x = 31987, y = 31190, z = 10 }, flamePos = {x = 31973, y = 31166, z = 10}},
	[3257] = {bossName = "zanakeph", storage = 35027, playerPos = {x = 33077, y = 31040, z = 12}, bossPos = {x = 33082, y = 31056, z = 12 },  fromPos = {x = 33059, y = 31039, z = 12 }, toPos = {x = 33093, y = 31064, z = 12 }, flamePos = {x = 33070, y = 31039, z = 12}},
}

function onStepIn(cid, item, position, lastPosition)
	B = bosses[item.uid]
		if(getPlayerStorageValue(cid, B.storage) == 1) then
			if(doCheckArea(B.fromPos, B.toPos) == false) then
				setPlayerStorageValue(cid, B.storage, 0)
				doTeleportThing(cid, B.playerPos)
				doSendMagicEffect(B.playerPos, CONST_ME_TELEPORT)
				doSummonCreature(B.bossName, B.bossPos)
				addEvent(removeSummon, 60 * 10 * 1000, B.fromPos, B.toPos)
				addEvent(removePlayer, 60 * 10 * 1000, B.fromPos, B.toPos , lastPosition, cid)
				doCreatureSay(cid, "You have ten minutes to kill and loot this boss. else you will lose that chance and will be kicked out." , TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, lastPosition)
			end
		else
			doTeleportThing(cid, lastPosition)
		end
	return true
end
