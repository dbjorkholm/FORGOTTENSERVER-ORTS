local lava = {
	Position(32912, 32209, 15),
	Position(32913, 32209, 15),
	Position(32912, 32210, 15),
	Position(32913, 32210, 15)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	for i = 1, #lava do
		local lavaTile = Tile(lava[i])
		if lavaTile:getItemById(598) then
			lavaTile:getItemById(598):transform(407)
			lava[i]:sendMagicEffect(CONST_ME_SMOKE)
		elseif lavaTile:getItemById(407) then
			lavaTile:getItemById(407):transform(598)
			lava[i]:sendMagicEffect(CONST_ME_SMOKE)
		end
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
