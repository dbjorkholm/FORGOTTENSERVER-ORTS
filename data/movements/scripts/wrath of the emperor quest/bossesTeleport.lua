local positions = {
	[3189] = {x = 33041, y = 31086, z = 15},
	[3190] = {x = 33091, y = 31083, z = 15},
	[3191] = {x = 33094, y = 31118, z = 15},
	[3192] = {x = 33038, y = 31119, z = 15},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) ~= item.uid - 3188 then
		player:teleportTo(fromPosition)
		return true
	end

	if Game.getStorageValue(item.uid) ~= 1 then
		player:teleportTo(positions[item.uid])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition)
	end
	return true
end
