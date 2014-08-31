local config = {
	gatePositions = {
		Position(32569, 31421, 9),
		Position(32569, 31422, 9)
	},
	removeCreaturePosition = Position(32568, 31422, 9),
	wallID = 3519,
	tileID = 3154
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile, thing, creature, levertile, lever
	for i = 1, #config.gatePositions do
		tile = Tile(config.gatePositions[i])
		if tile then
			thing, creature = tile:getItemById(item.itemid == 1945 and config.tileID or config.wallID), tile:getTopCreature()
			if thing then
				thing:transform(item.itemid == 1945 and config.wallID or config.tileID)
			end

			if creature then
				creature:teleportTo(config.removeCreaturePosition)
			end
		end
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
