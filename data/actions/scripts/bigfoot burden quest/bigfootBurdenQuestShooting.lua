function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local pos = {x = player:getPosition().x, y = player:getPosition().y - 5, z = 10}
	if item.itemid == 18225 then
		if player:getStorageValue(902) < 6 then
			if Tile(pos):getItemById(18226) then
				player:setStorageValue(902, player:getStorageValue(902) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Hit!")
				Tile(pos):getItemById(18226):remove(1)
				pos:sendMagicEffect(CONST_ME_FIREATTACK)
				for i = 2, 4 do
					local effectPos = {x = player:getPosition().x, y = player:getPosition().y - i, z = 10}
					effectPos:sendMagicEffect(CONST_ME_TELEPORT)
				end	
			elseif Tile(pos):getItemById(18227) then
				player:setStorageValue(902, player:getStorageValue(902) < 1 and 0 or player:getStorageValue(902) - 1)
				Tile(pos):getItemById(18227):remove(1)
				pos:sendMagicEffect(CONST_ME_FIREATTACK)
				for i = 2, 4 do
					local effectPos = {x = player:getPosition().x, y = player:getPosition().y - i, z = 10}
					effectPos:sendMagicEffect(CONST_ME_TELEPORT)
				end	
			end
		end	
	end
	return true
end