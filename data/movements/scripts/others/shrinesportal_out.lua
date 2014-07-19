local config = {
	{storageKey = 10017, teleportPos = Position(32360, 31781, 9)},
	{storageKey = 10018, teleportPos = Position(32369, 32242, 6)},
	{storageKey = 10019, teleportPos = Position(32958, 32077, 5)},
	{storageKey = 10020, teleportPos = Position(32681, 31686, 2)},
	{storageKey = 10021, teleportPos = Position(32646, 31925, 11)},
	{storageKey = 10022, teleportPos = Position(33230, 32392, 5)},
	{storageKey = 10023, teleportPos = Position(33130, 32815, 4)},
	{storageKey = 10024, teleportPos = Position(33266, 31835, 9)},
	{storageKey = 10025, teleportPos = Position(32337, 32837, 8)},
	{storageKey = 10026, teleportPos = Position(32628, 32743, 4)},
	{storageKey = 10027, teleportPos = Position(32213, 31132, 8)},
	{storageKey = 10028, teleportPos = Position(32786, 31245, 5)}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		if player:getStorageValue(table.storageKey) == 1 then
			player:teleportTo(table.teleportPos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(table.storageKey, 0)
			break
		else
			player:teleportTo(player:getTown():getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end
