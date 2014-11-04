function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	player:addMana(math.max(1,player:getMaxMana() - player:getMana()))
	player:say("Chomp.", TALKTYPE_MONSTER_SAY)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your mana was refilled completely.")
	Item(item.uid):remove(1)
	return true
end
