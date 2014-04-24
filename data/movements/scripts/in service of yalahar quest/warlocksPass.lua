function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 7813) then
		if(lastPosition.y == 31081) then
			if(getPlayerItemCount(cid, 8299) >= 1) then
				doPlayerRemoveItem(cid, 8299, 1)
				doSendMagicEffect(position, CONST_ME_MAGIC_RED)
			else
				doTeleportThing(cid, lastPosition)
				doCreatureSay(cid, "You may not enter without a sacrifice of a glimmering soil.", TALKTYPE_ORANGE_1)
				doSendMagicEffect(position, CONST_ME_ENERGY)
			end
		else
			doTeleportThing(cid, {x = lastPosition.x, y = lastPosition.y - 1, z = lastPosition.z})	
			doSendMagicEffect({x = lastPosition.x, y = lastPosition.y - 1, z = lastPosition.z}, CONST_ME_ENERGY)
		end
	elseif(item.actionid == 7814) then
		if (lastPosition.y == 31080) then
			if(getPlayerItemCount(cid, 8303) >= 1) then
				doPlayerRemoveItem(cid, 8303, 1)
				doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			else
				doTeleportThing(cid, lastPosition)
				doCreatureSay(cid, "You may not enter without a sacrifice of a energy soil.", TALKTYPE_ORANGE_1)
				doSendMagicEffect(position, CONST_ME_ENERGY)
			end
		elseif (lastPosition.y == 31023) then --ice island Yakchal room
			if(getPlayerStorageValue(cid, 12001) >= 40) then
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			else
			doCreatureSay(cid, "You may not enter without absolve the ice island quest.", TALKTYPE_ORANGE_1)
			doTeleportThing(cid, lastPosition)
			doSendMagicEffect(position, CONST_ME_ENERGY)
			end
		else
			doTeleportThing(cid, {x = lastPosition.x, y = lastPosition.y + 1, z = lastPosition.z})	
			doSendMagicEffect({x = lastPosition.x, y = lastPosition.y + 1, z = lastPosition.z}, CONST_ME_ENERGY)			
		end
	end
	return true
end
