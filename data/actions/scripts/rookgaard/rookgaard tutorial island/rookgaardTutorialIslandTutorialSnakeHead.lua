local function doTransformSmallSnakeHead(fromId, toId)
	local tile = Position(32034, 32272, 8):getTile()
	if tile then
		local thing = tile:getItemById(fromId)
		if thing and thing:isItem() then
			thing:transform(toId)
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doTransformSmallSnakeHead(5058, 5057)
	else
		doTransformSmallSnakeHead(5057, 5058)
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end	