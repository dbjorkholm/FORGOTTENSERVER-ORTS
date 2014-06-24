function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 7242 then
		if itemEx.uid == 3015 and player:getStorageValue(90) == 54 then
			player:setStorageValue(90, 55)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		elseif itemEx.uid == 3016 and player:getStorageValue(90) == 55 then
			player:setStorageValue(90, 56)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end
