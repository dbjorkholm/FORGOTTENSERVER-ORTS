function onStepIn(cid, item, position, fromPosition)
	if(item.uid == 2243 and item.itemid == 1387) then
		doTeleportThing(cid, {x = 32857, y = 32234, z = 11})
		doSendMagicEffect({x = 32857, y = 32234, z = 11}, CONST_ME_TELEPORT)
		doTransformItem(item.uid, 2249)
	end
	return true
end