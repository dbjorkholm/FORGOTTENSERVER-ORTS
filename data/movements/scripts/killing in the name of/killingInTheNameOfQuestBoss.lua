dofile('data/lib/killingInTheNameOfQuest.lua')

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

function removeBoss(fromArea, bossName)
	for x = fromArea[1].x, fromArea[2].x do
		for y = fromArea[1].y, fromArea[2].y do
			for z = fromArea[1].z, fromArea[2].z do
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

function fireOfLife(pos, time)
	fire = getTileThingById(pos, 10288).uid
	doSetItemSpecialDescription(fire, "")
	if(time > 0) then
		return addEvent(fireOfLife, 1000, pos, time)
	end
	return true
end

local bosses = {
	[3230] = {bossname = "the snapper", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3231] = {bossname = "hide", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3232] = {bossname = "deathbine", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3233] = {bossname = "the bloodtusk", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3234] = {bossname = "shardhead", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3235] = {bossname = "esmeralda", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3236] = {bossname = "fleshcrawler 	", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3237] = {bossname = "ribstride", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3238] = {bossname = "bloodweb", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3239] = {bossname = "thul", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3240] = {bossname = "the old widow", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3241] = {bossname = "hemming", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3242] = {bossname = "tormentor", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3243] = {bossname = "flameborn", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3244] = {bossname = "fazzrah", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3245] = {bossname = "tromphonyte", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3246] = {bossname = "sulphur scuttler", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3247] = {bossname = "bruise payne", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3248] = {bossName = "the many", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3249] = {bossname = "the noxious spawn", race = "serpent spawn", bossPos = {x = 32842, y = 32675, z = 11}, firePos = {x = 32842, y = 32664, z = 11}, newPos = {x = 32842, y = 32664, z = 11}},
	[3250] = {bossname = "gorgo", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3251] = {bossname = "stonecracker", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3252] = {bossname = "leviathan", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3253] = {bossname = "kerberos", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3254] = {bossname = "ethershreck", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3255] = {bossname = "paiz the pauperizer", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3256] = {bossname = "bretzecutioner", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
	[3257] = {bossname = "zanakeph", race = "", bossPos = {x = , y = , z = }, firePos = {x = , y = , z = } , newPos = {x = , y = , z = }},
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 4000) == 2) then
		if(getPlayerStorageValue(cid, 4008) == bosses[item.uid].race) then
			if(doCheckArea(fromPos, toPos) == false) then
				setPlayerStorageValue(cid, 4000, 0)
				doTeleportThing(cid, )
				doSendMagicEffect(, CONST_ME_TELEPORT)
				doSummonCreature(bosses[item.uid].bossName, bosses[item.uid].bossPos)
				addEvent(doRemovePlayer, 10 * 60 * 1000, cid, fromPos, toPos, lastPosition)
				addEvent(removeBoss, 10 * 60 * 1000, fromArea, bossName)
				doCreatureSay(cid, , TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, lastPosition)
			end
		else
			doTeleportThing(cid, lastPosition)
		end
	else
		doTeleportThing(cid, lastPosition)
	end	
	return true
end
