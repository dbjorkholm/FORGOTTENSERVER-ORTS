local destination = {
	[3140] = {newPos = {x = 32996, y = 31922, z = 10}, missionStorageKey = 955, missionStorageValue = 1},
	[3141] = {newPos = {x = 33011, y = 31943, z = 11}, missionStorageKey = 956, missionStorageValue = 2},
	[3142] = {newPos = {x = 32989, y = 31909, z = 12}, missionStorageKey = 957, missionStorageValue = 3},
}

function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if item.uid == 3140 then
			doTeleportThing(cid, {x = 32996, y = 31922, z = 10})
			doSendMagicEffect({x = 32996, y = 31922, z = 10}, CONST_ME_TELEPORT)
		elseif item.uid == 3141 then
			doTeleportThing(cid, {x = 33011, y = 31943, z = 11})
			doSendMagicEffect({x = 33011, y = 31943, z = 11}, CONST_ME_TELEPORT)
		elseif item.uid == 3142 then
			doTeleportThing(cid, {x = 32989, y = 31909, z = 12})
			doSendMagicEffect({x = 32989, y = 31909, z = 12}, CONST_ME_TELEPORT)
		end				
		--doTeleportThing(cid, destination[item.uid])
		--doSendMagicEffect(destination[item.uid], CONST_ME_TELEPORT)
	end
	return true
end