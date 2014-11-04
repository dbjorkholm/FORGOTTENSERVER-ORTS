function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid ~= 2700 then
		return false
	end

	Item(item.uid):remove(1)
	player:addItem(13539, 1)
	toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	return true
end