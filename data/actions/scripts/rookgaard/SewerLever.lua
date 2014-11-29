local config = {
	bridgePositions = {
		{Position(32099, 32205, 8), 4645},
		{Position(32100, 32205, 8), 4616},
		{Position(32101, 32205, 8), 4647}
	},
	leverPositions = {
		Position(32098, 32204, 8),
		Position(32104, 32204, 8)
	},
	removeCreaturePosition = Position(32098, 32205, 8),
	bridgeID = 5770
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local tile, thing, creature, lever, leverstatus
	leverstatus = item.itemid
	for i = 1, #config.leverPositions do
		lever = Tile(config.leverPositions[i]):getItemById(leverstatus == 1945 and 1945 or 1946)
		lever:transform(item.itemid == 1945 and 1946 or 1945)
	end
	for i = 1, #config.bridgePositions do
		tile = Tile(config.bridgePositions[i][1])
		if tile then
			creature = tile:getTopCreature()
			if leverstatus == 1945 then
				thing = tile:getItemById(config.bridgeID)
				thing:transform(config.bridgePositions[i][2])
			else
				thing = tile:getItemById(config.bridgePositions[i][2])
				thing:transform(config.bridgeID)
			end
			if creature then
				creature:teleportTo(config.removeCreaturePosition)
			end
		end
	end
	return true
end
