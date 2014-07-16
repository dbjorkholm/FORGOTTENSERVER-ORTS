function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if player:getStorageValue(item.uid - 10) < 1 then
		player:teleportTo(fromPosition)
		player:say("You've not absorbed energy from this throne.", TALKTYPE_MONSTER_SAY)
	end
	return true
end
