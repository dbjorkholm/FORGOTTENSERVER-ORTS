function onUse(cid, item, fromPosition, itemEx, toPosition)
	Item(item.uid):getPosition():sendMagicEffect(CONST_ME_SOUND_BLUE)
	return true
end
