function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 12101) then
		local player = Player(cid)
		player:teleportTo(lastPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
