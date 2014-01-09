function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if(item.uid == 3175) then
			if(getPlayerStorageValue(cid, 1067) == 1) then
				doTeleportThing(cid, {x = 33363, y = 31188, z = 8})
				doSendMagicEffect({x = 33363, y = 31188, z = 8}, CONST_ME_TELEPORT)
				doSetCreatureOutfit(cid, {lookType = 352}, 1)
				setPlayerStorageValue(cid, 1067, 0)
			end
		end
	end
	return true
end
