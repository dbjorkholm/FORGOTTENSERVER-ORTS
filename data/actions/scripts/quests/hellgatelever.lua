local config = {
	bridgePositions = {
		[1] = Position(32627, 31699, 10),
		[2] = Position(32628, 31699, 10),
		[3] = Position(32629, 31699, 10)
	},
	removeCreaturePosition = Position(32630, 31699, 10),
	bridgeID = 5770,
	waterID = 493
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	for i = 1, #config.bridgePositions do
		--if Creature on bridge then push off
		local creature = Tile(config.bridgePositions[i]):getTopCreature()
		if creature ~= nil then
			creature:teleportTo(config.removeCreaturePosition)
		end
		--create and remove bridge
		local tile = config.bridgePositions[i]:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 1945 and config.waterID or config.bridgeID)
			if thing then
				thing:transform(item.itemid == 1945 and config.bridgeID or config.waterID)
			end
		end
	end	
	
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
