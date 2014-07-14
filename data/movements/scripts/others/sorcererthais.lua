function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if isSorcerer(cid) then
		return false
	end
	
	player:teleportTo(Position(32308, 32267, 7))
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end