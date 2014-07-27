function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 8176 then
		return false
	end
	
	local player = Player(cid)
	player:removeItem(7496, 1)
	player:addItem(7495, 1)
	player:say("GULP, GULP, GULP", TALKTYPE_MONSTER_SAY, false, 0, toPosition)
	toPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
	return true
end
