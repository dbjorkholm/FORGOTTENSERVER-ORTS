function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.actionid == 7799 then
		player:teleportTo({x=32842, y=32275, z=10})
		player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
	end
	return true
end