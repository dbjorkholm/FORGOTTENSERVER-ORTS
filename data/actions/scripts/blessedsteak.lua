function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	player:addMana(math.max(1,player:getMaxMana() - player:getMana()))
	player:say("Chomp.", TALKTYPE_MONSTER_SAY)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your mana was refilled completely.")
	Item(item.uid):remove(1)
	return true
end
