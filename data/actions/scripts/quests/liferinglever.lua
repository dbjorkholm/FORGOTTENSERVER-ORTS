local config = {
	bridgePositions = {
		[1] = Position(32410, 32232, 10),
		[2] = Position(32411, 32232, 10),
		[3] = Position(32412, 32232, 10),
		[4] = Position(32410, 32231, 10),
		[5] = Position(32411, 32231, 10),
		[6] = Position(32412, 32231, 10)
	},
	bridgeID = 5770,
	waterID = 4615
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	for i = 1, #config.bridgePositions do
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
