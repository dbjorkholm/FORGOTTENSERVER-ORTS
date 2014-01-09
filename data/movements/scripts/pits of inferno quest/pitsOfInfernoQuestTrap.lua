function onStepIn(cid, item, position, lastPosition)
	doTeleportThing(cid, {x = 32842, y = 32275, z = 10})
	doSendMagicEffect({x = 32842, y = 32275, z = 10}, CONST_ME_EXPLOSION)
	return true
end