local destination = {
	[3121] = {newPos = {x = 32803, y = 31797, z = 9}, storage = 1, crystal = true},
	[3220] = {newPos = {x = 32627, y = 31863, z = 11}, storage = 1, crystal = true},
	[3128] = {newPos = {x = 33000, y = 31870, z = 13}, storage = 14},
	[3129] = {newPos = {x = 32795, y = 31762, z = 10}, storage = 14},
	[3130] = {newPos = {x = 32864, y = 31844, z = 11}, storage = 15},
	[3131] = {newPos = {x = 32803, y = 31746, z = 10}, storage = 15},
	[3132] = {newPos = {x = 32986, y = 31862, z = 9}, storage = 15}, -- Gnomebase Alpha
	[3133] = {newPos = {x = 32796, y = 31781, z = 10}, storage = 15}, -- City
	[3134] = {newPos = {x = 32959, y = 31953, z = 9}, storage = 16}, -- Golems
	[3135] = {newPos = {x = 33001, y = 31915, z = 9}, storage = 16}, -- Gnomebase Alpha
	[3136] = {newPos = {x = 32904, y = 31894, z = 13}, storage = 16},
	[3137] = {newPos = {x = 32979, y = 31907, z = 9}, storage = 16},
	[35669] = {newPos = {x = 32986, y = 31864, z = 9}},
}

function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if item.uid == 3215 then
			doTeleportThing(cid, getTownTemplePosition(2))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)	
		elseif item.uid == 3216 then
			doTeleportThing(cid, getTownTemplePosition(12))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		elseif item.uid == 3217 then
			doTeleportThing(cid, getTownTemplePosition(7))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		elseif item.uid == 3218 then
			doTeleportThing(cid, getTownTemplePosition(11))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		elseif item.uid == 3219 then
			doTeleportThing(cid, getTownTemplePosition(10))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		end
		doTeleportThing(cid, destination[item.uid].newPos)
		doSendMagicEffect(destination[item.uid].newPos, CONST_ME_TELEPORT)
	end
	return true
end
