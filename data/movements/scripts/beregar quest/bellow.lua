function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local crucible = Tile(Position(32699, 31494, 11)):getItemById(8641)
	if crucible and crucible:getActionId() == 0 then
		crucible:setActionId(50120)
		Position(32696, 31494, 11):sendMagicEffect(CONST_ME_POFF) -- smoke?
	elseif crucible and crucible:getActionId() == 50120 then
		crucible:setActionId(50121)
		Position(32695, 31494, 10):sendMagicEffect(CONST_ME_POFF) -- smoke?
	elseif crucible and crucible:getActionId() == 50121 then
		Player(cid):say("TSSSSHHHHH", TALKTYPE_MONSTER_SAY, false, 0, Position(32695, 31494, 11))
		Player(cid):say("CHOOOOOOOHHHHH", TALKTYPE_MONSTER_SAY, false, 0, Position(32698, 31492, 11))
	end
	return true
end
