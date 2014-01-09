local Area_fromPos, Area_toPos = {x = 33235, y = 31801, z = 12}, {x = 33299, y = 31867, z = 12}
	
function onStepIn(cid, item, position, lastPosition)
	if isPlayer(cid) then
		if isPlayerInArea(Area_fromPos, Area_toPos) then
			doTeleportThing(cid, {x = 33265, y = 31838, z = 10})
			doSendMagicEffect({x = 33265, y = 31838, z = 10}, CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 10005, 0)
			setPlayerStorageValue(cid, 10006, 0)
			setPlayerStorageValue(cid, 10007, 0)
			setPlayerStorageValue(cid, 10008, 0)
			print("Player is here")
		else
			setGlobalStorageValue(10004, 0)	
			doTeleportThing(cid, {x = 33265, y = 31838, z = 10})
			doSendMagicEffect({x = 33265, y = 31838, z = 10}, CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 10005, 0)
			setPlayerStorageValue(cid, 10006, 0)
			setPlayerStorageValue(cid, 10007, 0)
			setPlayerStorageValue(cid, 10008, 0)	
			print("Player is not here")
		end
	end
	return true
end
