local config = {
	[10017] = {Position(32360, 31781, 9)},
	[10018] = {Position(32369, 32242, 6)},
	[10019] = {Position(32958, 32077, 5)},
	[10020] = {Position(32681, 31686, 2)},
	[10021] = {Position(32646, 31925, 11)},
	[10022] = {Position(33230, 32392, 5)},
	[10023] = {Position(33130, 32815, 4)},
	[10024] = {Position(33266, 31835, 9)},
	[10025] = {Position(32337, 32837, 8)},
	[10026] = {Position(32628, 32743, 4)},
	[10027] = {Position(32213, 31132, 8)},
	[10028] = {Position(32786, 31245, 5)},
}

function onStepIn(cid, item, position, fromPosition)
	local player = player(cid)
	if not player then
		return true
	end

	local storageValue = config[i]
	if player:getStorageValue(storageValue) == 1 then
		player:teleportTo(storageValue[1])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(storageValue, 0)
	else
		player:teleportTo(getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

