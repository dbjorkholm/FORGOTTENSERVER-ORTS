local teleports = {
	[3186] = {{x = 33084, y = 31214, z = 8}, scale = true},
	[3187] = {{x = 33093, y = 31122, z = 12}, scale = true},
}

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 1060) >= 29) then
			if(getPlayerItemCount(cid, 12629) >= 1) then
				doRemoveItem(cid, 12629, 1)
			else
				doTeleportThing(cid, fromPosition)
				return true
			end	
			doTeleportThing(cid, teleports[item.uid][1])
			doSendMagicEffect(teleports[item.uid][1], CONST_ME_TELEPORT)
		end
	else
		doTeleportThing(cid, fromPosition)
	end
	return true
end
