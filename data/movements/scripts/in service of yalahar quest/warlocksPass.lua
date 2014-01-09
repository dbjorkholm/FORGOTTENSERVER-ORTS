function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 7813) then
		if(getPlayerItemCount(cid, 8299) >= 1 and lastPosition.y == 31081) then
			doRemoveItem(cid, 8299, 1)
			doSendMagicEffect(position, CONST_ME_MAGIC_RED)
		else
			doTeleportThing(cid, lastPosition)
			doCreatureSay(cid, "You may not enter without a sacrifice of a glimmering soil.", TALKTYPE_ORANGE_1)
			doSendMagicEffect(position, CONST_ME_ENERGY)
		end
	elseif(item.actionid == 7814) then
		if(getPlayerItemCount(cid, 8303) >= 1 and lastPosition.y == 31080) then
			doRemoveItem(cid, 8303, 1)
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
		else
			doTeleportThing(cid, lastPosition)
			doCreatureSay(cid, "You may not enter without a sacrifice of a energy soil.", TALKTYPE_ORANGE_1)
			doSendMagicEffect(position, CONST_ME_ENERGY)
		end
	end
	return true
end
