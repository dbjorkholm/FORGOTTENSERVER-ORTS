function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	if player:getItemCount(1970) >= 1 then
		if item.uid == 2000 then
			player:teleportTo({x = 32791, y = 32331, z = 10}, false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		elseif item.uid == 2001 then
			player:teleportTo({x = 32791, y = 32327, z = 10}, false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		player:teleportTo(fromPosition)
	end
	return true
end