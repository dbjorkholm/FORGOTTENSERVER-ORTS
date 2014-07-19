function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	player:teleportTo(Position(32842, 32275, 10))
	player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
	return true
end
