local destination = {
	[3140] = {newPos = {x = 32996, y = 31922, z = 10}, missionStorageKey = 955, missionStorageValue = 1},
	[3141] = {newPos = {x = 33011, y = 31943, z = 11}, missionStorageKey = 956, missionStorageValue = 2},
	[3142] = {newPos = {x = 32989, y = 31909, z = 12}, missionStorageKey = 957, missionStorageValue = 3},
}

function onStepIn(cid, item, position, lastPosition)
	local uniqueid = destination[item.uid]
	if uniqueid then
		local player = Player(cid)
		if not player then
			return true
		end
		if player:getStorageValue(uniqueid.missionStorageKey) == uniqueid.missionStorageValue then
			player:teleportTo(uniqueid.newPos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(lastPosition)
		end
	end
return true
end
