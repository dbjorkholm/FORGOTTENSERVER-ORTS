function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.actionid == 7813 then
		if fromPosition.y == 31081 then
			if player:getItemCount(8299) >= 1 then
				player:removeItem(8299, 1)
				doSendMagicEffect(position, CONST_ME_MAGIC_RED)
			else
				player:teleportTo(fromPosition)
				player:say("You may not enter without a sacrifice of a glimmering soil.", TALKTYPE_MONSTER_SAY)
				position:sendMagicEffect(CONST_ME_ENERGYHIT)
			end
		else
			player:teleportTo({x = fromPosition.x, y = fromPosition.y - 1, z = fromPosition.z})	
			Position({x = fromPosition.x, y = fromPosition.y - 1, z = fromPosition.z}):sendMagicEffect(CONST_ME_ENERGYHIT)
		end
	elseif item.actionid == 7814 then
		if fromPosition.y == 31080 then
			if player:getItemCount(8303) >= 1 then
				player:removeItem(8303, 1)
				position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				player:teleportTo(fromPosition)
				player:say("You may not enter without a sacrifice of a energy soil.", TALKTYPE_MONSTER_SAY)
				position:sendMagicEffect(CONST_ME_ENERGYHIT)
			end
		elseif fromPosition.y == 31023 then --ice island Yakchal room
			if player:getStorageValue(12001) >= 40 then
			position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
			player:say("You may not enter without absolve the ice island quest.", TALKTYPE_MONSTER_SAY)
			player:teleportTo(fromPosition)
			position:sendMagicEffect(CONST_ME_ENERGYHIT)
			end
		else
			player:teleportTo({x = fromPosition.x, y = fromPosition.y + 1, z = fromPosition.z})	
			Position({x = fromPosition.x, y = fromPosition.y + 1, z = fromPosition.z}):sendMagicEffect(CONST_ME_ENERGYHIT)			
		end
	end
	return true
end
