local nodes = {
	[3206] = {x = 32359, y = 32901, z = 7},
	[3207] = {x = 32340, y = 32538, z = 7},
	[3208] = {x = 32472, y = 32869, z = 7},
	[3209] = {x = 32415, y = 32916, z = 7},
	[3210] = {x = 32490, y = 32979, z = 7},
	[3211] = {x = 32440, y = 32971, z = 7},
	[3212] = {x = 32527, y = 32951, z = 7},
	[3213] = {x = 32523, y = 32923 z = 7},
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 1140) < 2000) then
		setPlayerStorageValue(cid, 1140, math.max(0, getPlayerStorageValue(cid, 1140)) + 1)
	end
	doTeleportThing(cid, nodes[item.uid])
	doSendMagicEffect(nodes[item.uid], CONST_ME_TELEPORT)
	return true
end