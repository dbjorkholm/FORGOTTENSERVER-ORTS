function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if itemEx.itemid == 8176 then
		player:removeItem(7496, 1)
		player:addItem(7495, 1)
		player:say("GULP, GULP, GULP", TALKTYPE_MONSTER_SAY, false, 0, toPosition)
		toPosition:sendMagicEffect(CONST_ME_NOTES) --should be yellow music notes
	else
		return false
	end
	return true
end
