local config = {
	[1945] = {position = {Position(32623, 32188, 9), Position(32623, 32189, 9)}},
	[1946] = {position = {Position(32623, 32189, 9), Position(32623, 32188, 9)}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end


	local oven = Tile(useItem.position[1]):getTopTopItem()
	if oven and isInArray({1786, 1787}, oven:getId()) then
		oven:moveTo(useItem.position[2])
	end

	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
