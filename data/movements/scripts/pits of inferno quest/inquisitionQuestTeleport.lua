function onStepIn(cid, item, position, lastPosition)
	pass = false
	for i = 0, 6 do
		if(getPlayerStorageValue(cid, 2080 + i) == 1) then
			pass = true
		end
	end
	
	if(getPlayerStorageValue(cid, 200) == 22 and pass) then
		doTeleportThing(cid, {x = , y = , z = })
		doSendMagicEffect({x = , y = , z = }, CONST_ME_TELEPORT)
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end
