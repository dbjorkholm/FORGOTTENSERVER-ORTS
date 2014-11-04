function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	Item(item.uid):getPosition():sendMagicEffect(CONST_ME_SOUND_BLUE)
	return true
end
