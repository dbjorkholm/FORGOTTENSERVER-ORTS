local config = {
	[3041] = {position = Position(32836, 32221, 14), itemId = 7844},
	[3042] = {position = Position(32837, 32229, 14), itemId = 7846},
	[3043] = {position = Position(32833, 32225, 14), itemId = 7845}
}

local function revertLever(position)
	local leverItem = Tile(position):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end
end

function onUse(cid, item, position, itemEx, toPosition)
	local altar = config[item.uid]
	if not altar then
		return true
	end

	if item.itemid ~= 1945 then
		return true
	end

	local diamondItem = Tile(altar.position):getItemById(2145)
	if diamondItem then
		diamondItem:remove(1)
		altar.position:sendMagicEffect(CONST_ME_TELEPORT)
		Game.createItem(altar.itemId, 1, altar.position)
		Item(item.uid):transform(1946)
		addEvent(revertLever, 4 * 1000, position)
	end
	return true
end