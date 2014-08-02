local teleportPosition = Position(33075, 31878, 12)
local abyssadorPosition = Position(33086, 31907, 12)

local function transformTeleport()
	local teleportItem = Tile(teleportPosition):getItemById(1387)
	if not teleportItem then
		return
	end

	teleportItem:transform(18463)
end

function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'vesperoth' then
		return true
	end

	setGlobalStorageValue(3147, 2)
	addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3147, 0)

	Game.createItem(1387, 1, teleportPosition)
	Game.createMonster('abyssador', abyssadorPosition)

	addEvent(transformTeleport, 30 * 60 * 1000)
	addEvent(teleportAllPlayersFromArea,6 * 20 * 1000 + 30 * 60 * 1000, {
		{x = 33078, y = 31900, z = 12},
		{x = 33100, y = 31922, z = 12}
	}, {x = 32993, y = 31912, z = 12})

	addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
		{x = 33078, y = 31900, z = 12},
		{x = 33100, y = 31922, z = 12}
	}, 'abyssador')
	return true
end