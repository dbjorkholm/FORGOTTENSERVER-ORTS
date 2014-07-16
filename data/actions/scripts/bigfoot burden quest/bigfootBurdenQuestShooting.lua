function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	pos = {x = player:getPosition().x, y = player:getPosition().y - 5, z = 10}
	if(item.itemid == 18225) then
		if(player:getStorageValue(902) < 6) then
			if(getTileItemById(pos, 18226).uid > 0) then
				player:setStorageValue(902, player:getStorageValue(902) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Hit!")
				doRemoveItem(getTileItemById(pos, 18226).uid, 1)
				pos:sendMagicEffect(CONST_ME_FIREATTACK)
				for i = 2, 4 do
					effectPos = {x = player:getPosition().x, y = player:getPosition().y - i, z = 10}
					effectPos:sendMagicEffect(CONST_ME_TELEPORT)
				end	
			elseif(getTileItemById(pos, 18227).uid > 0) then
				player:setStorageValue(902, player:getStorageValue(902) < 1 and 0 or player:getStorageValue(902) - 1)
				doRemoveItem(getTileItemById(pos, 18227).uid, 1)
				pos:sendMagicEffect(CONST_ME_FIREATTACK)
				for i = 2, 4 do
					effectPos = {x = player:getPosition().x, y = player:getPosition().y - i, z = 10}
					effectPos:sendMagicEffect(CONST_ME_TELEPORT)
				end	
			end
		end	
	end
	return true
end