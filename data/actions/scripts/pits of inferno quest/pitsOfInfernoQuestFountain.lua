function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:say("You feel very refreshed and relaxed.", TALKTYPE_ORANGE_1)
	return true
end