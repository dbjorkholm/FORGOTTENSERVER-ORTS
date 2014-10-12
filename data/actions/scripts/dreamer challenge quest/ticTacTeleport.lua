local config = {
	{position = Position(32845, 32264, 14), itemId = 2639},
	{position = Position(32843, 32266, 14), itemId = 2639},
	{position = Position(32843, 32268, 14), itemId = 2639},
	{position = Position(32845, 32268, 14), itemId = 2639},
	{position = Position(32844, 32267, 14), itemId = 2639},
	{position = Position(32840, 32269, 14), itemId = 2639},
	{position = Position(32841, 32269, 14), itemId = 2638},
	{position = Position(32840, 32268, 14), itemId = 2638},
	{position = Position(32842, 32267, 14), itemId = 2638}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local tokens, ticTacToeItem = true
	for i = 1, #config do
		ticTacToeItem = Tile(config[i].position):getItemById(config[i].itemId)
		if not ticTacToeItem then
			tokens = false
			break
		end
	end

	if not tokens then
		return true
	end

	for i = 1, #config do
		Tile(config[i].position):getItemById(config[i].itemId):remove()
	end

	local crack = Tile(Position(32836, 32288, 14)):getItemById(6299)
	if crack then
		crack:transform(1387)
		crack:setActionId(9032)
	end
	return true
end
