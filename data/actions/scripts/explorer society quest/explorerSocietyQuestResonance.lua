function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.uid == 3018 and item.itemid == 7281 then
		if player:getStorageValue(90) == 60 then
			player:setStorageValue(90, 61)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end
