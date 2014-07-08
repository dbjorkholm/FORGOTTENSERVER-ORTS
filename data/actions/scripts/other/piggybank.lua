function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local orig = Position(fromPosition)
	local item = Item(item.uid)
	if math.random(6) == 1 then
		orig:sendMagicEffect(CONST_ME_POFF)
		player:addItem(ITEM_GOLD_COIN, 1)
		item:transform( 2115)
	else
		orig:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		player:addItem(ITEM_PLATINUM_COIN, 1)
	end
	return true
end