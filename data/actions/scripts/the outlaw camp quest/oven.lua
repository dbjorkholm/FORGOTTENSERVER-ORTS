local config = {
	[1945] = {Position(32623, 32188, 9), Position(32623, 32189, 9)},
	[1946] = {Position(32623, 32189, 9), Position(32623, 32188, 9)}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[item.itemid]
	if not targetItem then
		return true
	end

	local tile = targetItem[1]:getTile()
	if tile then
		local thing = tile:getTopItem()
		if thing and isInArray({1786, 1787}, thing:getId()) then
			thing:moveTo(targetItem[2])
		end
	end

	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
