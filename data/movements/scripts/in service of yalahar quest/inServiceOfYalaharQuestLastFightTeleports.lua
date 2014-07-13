function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.uid == 7809 and isPlayer(cid) then
		if player:getStorageValue(Storage.InServiceofYalahar.Questline) == 51 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32783, y = 31174, z = 10})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say("The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER_SAY)

		else
			player:teleportTo(fromPosition)
		end
	elseif item.uid == 7810 and isPlayer(cid) then
		if getGlobalStorageValue(982) < 1 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32784, y = 31178, z = 9})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
		end
	end
	return true
end
