function onStepIn(cid, item, position, fromPosition)
	if Creature(cid):getName():lower() ~= 'mushroom sniffer' then
		return true
	end

	local moldFloor = Tile(position):getItemById(18340)
	if moldFloor:getActionId() == 100 then
		return true
	end

	if math.random(3) < 3 then
		moldFloor:transform(18218)
		moldFloor:decay()
		position:sendMagicEffect(CONST_ME_POFF)
	else
		moldFloor:transform(18341)
		moldFloor:decay()
		position:sendMagicEffect(CONST_ME_GROUNDSHAKER)
	end
	return true
end
