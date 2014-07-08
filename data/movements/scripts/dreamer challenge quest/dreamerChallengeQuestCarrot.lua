function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if item.uid == 2241 then
		if player:getItemCount(2684) >= 1 then
			player:teleportTo(Position(32861, 32235, 9))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:removeItem(2684, 1)
		else
			player:teleportTo(fromPosition)
			doAreaCombatHealth(cid, COMBAT_FIREDAMAGE, fromPosition, 0, -10, -20, CONST_ME_HITBYFIRE)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	elseif item.uid == 2242 then
		player:teleportTo(Position(32861, 32240, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
