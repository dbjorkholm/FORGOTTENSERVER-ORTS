local config = {
	leverPositions = {
		Position(32891, 32590, 11),
		Position(32843, 32649, 11),
		Position(32808, 32613, 11),
		Position(32775, 32583, 11),
		Position(32756, 32494, 11),
		Position(32799, 32556, 11),
		Position(32862, 32557, 11)
	},

	walls = {
		{position = Position(32864, 32556, 11), itemId = 3474, transformId = 3170},
		{position = Position(32865, 32556, 11), itemId = 3475, transformId = 3167}
	}
}

local function revertWalls(leverPosition)
	local leverItem = Tile(leverPosition):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end

	for i = 1, #config.walls do
		local wallItem = Tile(config.walls[i].position):getItemById(config.walls[i].transformId)
		if wallItem then
			wallItem:transform(config.walls[i].itemId)
		end
	end
end


function onUse(cid, item, position, itemEx, toPosition)
	if itemEx.itemid ~= 1945 then
		return true
	end

	if item.actionid == 12129 then
		for i = 1, #config.leverPositions do
			-- if lever not pushed, do not continue
			local leverItem = Tile(config.leverPositions[i]):getItemById(1946)
			if not leverItem then
				return true
			end
		end
	end

	-- open gate when all levers used
	for i = 1, #config.walls do
		local wallItem = Tile(config.walls[i].position):getItemById(config.walls[i].itemId)
		if not wallItem then
			return true
		end

		wallItem:transform(config.walls[i].transformId)
	end

	addEvent(revertWalls, 10 * 1000, position)
	Item(item.uid):transform(1946)
	return true
end
