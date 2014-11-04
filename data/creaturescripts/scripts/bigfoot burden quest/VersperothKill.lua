local teleportPosition = Position(33075, 31878, 12)

local function transformTeleport()
	local teleportItem = Tile(teleportPosition):getItemById(1387)
	if not teleportItem then
		return
	end

	teleportItem:transform(18463)
end

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'versperoth' then
		return true
	end

	Game.setStorageValue(GlobalStorage.Versperoth.Battle, 2)
	addEvent(Game.setStorageValue, 30 * 60 * 1000, GlobalStorage.Versperoth.Battle, 0)

	local holeItem = Tile(teleportPosition):getItemById(18462)
	if holeItem then
		holeItem:transform(1387)
	end
	Game.createMonster('abyssador', Position(33086, 31907, 12))

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
