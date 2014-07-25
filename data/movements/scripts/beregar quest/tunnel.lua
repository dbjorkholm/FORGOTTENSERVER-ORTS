function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
		
	player:teleportTo(Position(32616, 31514, 9))
	player:say("Use the ore wagon to pass this spot.", TALKTYPE_MONSTER_SAY, false, 0, pos)
	return true
end
