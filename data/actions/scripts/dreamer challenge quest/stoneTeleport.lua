local config = {
	sacrifices = {
		{position = Position(32878, 32270, 14), itemId = 2016},
		{position = Position(32881, 32267, 14), itemId = 2168},
		{position = Position(32881, 32273, 14), itemId = 6300},
		{position = Position(32884, 32270, 14), itemId = 1487}
	},
	wells = {
		{position = Position(32874, 32263, 14), wellId = 3729, transformId = 3733},
		{position = Position(32875, 32263, 14), wellId = 3730, transformId = 3734},
		{position = Position(32874, 32264, 14), wellId = 3731, transformId = 3735},
		{position = Position(32875, 32264, 14), wellId = 3732, transformId = 3736}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local sacrificeItems, sacrificeItem = true
	for i = 1, #config.sacrifices do
		local sacrifice = config.sacrifices[i]
		sacrificeItem = Tile(sacrifice.position):getItemById(sacrifice.itemId)
		if not sacrificeItem then
			sacrificeItems = false
			break
		end
	end

	if not sacrificeItems then
		return true
	end

	local stonePosition = Position(32881, 32270, 14)
	local stoneItem = Tile(stonePosition):getItemById(1355)
	if stoneItem then
		stoneItem:remove()
	end

	local teleportExists = Tile(stonePosition):getItemById(1387)
	if not teleportExists then
		local newItem = Game.createItem(1387, 1, stonePosition)
		if newItem then
			newItem:setActionId(9031)
		end
	end

	local wellItem
	for i = 1, #config.wells do
		local well = config.wells[i]
		wellItem = Tile(well.position):getItemById(well.itemId)
		if wellItem then
			wellItem:transform(well.transformId)
		end
	end

	for i = 1, #config.sacrifices do
		local sacrifice = config.sacrifices[i]
		sacrificeItem = Tile(sacrifice.position):getItemById(sacrifice.itemId)
		if sacrificeItem then
			sacrificeItem:remove()
		end
	end
	return true
end
