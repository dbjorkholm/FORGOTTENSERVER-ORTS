function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	position.z = position.z + 1
	player:teleportTo(position)
	position:sendMagicEffect(CONST_ME_FIREATTACK)
	return true
end
