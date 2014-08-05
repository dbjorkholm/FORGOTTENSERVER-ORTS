function onUse(cid, item, fromPosition, itemEx, toPosition)
	if math.random(6) == 1 then
		fromPosition:sendMagicEffect(CONST_ME_POFF)
		Player(cid):addItem(ITEM_GOLD_COIN, 1)
		Item(item.uid):transform( 2115)
	else
		fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		Player(cid):addItem(ITEM_PLATINUM_COIN, 1)
	end
	return true
end