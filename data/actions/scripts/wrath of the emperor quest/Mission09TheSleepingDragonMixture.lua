function onUse(cid, item, fromPosition, itemEx, toPosition)
	if Player(cid):getStorageValue(Storage.WrathoftheEmperor.InterdimensionalPotion) == 1 then
		return true
	end
	
	local player = Player(cid)
	Item(item.uid):remove()
	player:setStorageValue(Storage.WrathoftheEmperor.InterdimensionalPotion, 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end
