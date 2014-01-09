local pos = {
	{x = 32113, y = 32682, z = 5},
	{x = 32113, y = 32692, z = 5},
}

function onStepIn(cid, item, position, lastPosition)
	for i = 1, 2 do
		if(getTileItemById(pos[i], 1946).uid < 1) then
			doTeleportThing(cid, lastPosition)
			return true
		end
	end
	doTeleportThing(cid, {x = 32121, y = 32693, z = 4})
	doSendMagicEffect({x = 32121, y = 32693, z = 4}, CONST_ME_TELEPORT)
	return true
end