function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(BlueDjinn.MissionStart + 3) == 2 and player:getItemCount(2344) > 0 then
		player:removeItem(2344, 1)
		player:setStorageValue(BlueDjinn.MissionStart + 3, 3)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		player:addItem(2356,1)
	end
	return true
end
