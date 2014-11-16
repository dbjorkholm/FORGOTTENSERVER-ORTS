function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	Item(item.uid):remove(1)
	toPosition:sendMagicEffect(CONST_ME_POFF)
	player:say("You open the present.", TALKTYPE_MONSTER_SAY)
	return true
end
