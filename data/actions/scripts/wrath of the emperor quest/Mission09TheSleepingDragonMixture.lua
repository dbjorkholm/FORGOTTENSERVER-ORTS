function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.WrathoftheEmperor.InterdimensionalPotion) == 1 then
		return true
	end

	player:setStorageValue(Storage.WrathoftheEmperor.InterdimensionalPotion, 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	Item(item.uid):remove()
	return true
end
