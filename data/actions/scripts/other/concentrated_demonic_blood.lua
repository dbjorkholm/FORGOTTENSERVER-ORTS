function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local item = Item(item.uid)
	item:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
	item:transform(math.random(7588, 7589))
	return true
end
