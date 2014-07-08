function removeStone(pos)
	return getTileItemById({x = pos.x, y = pos.y, z = pos.z}, 1285).uid > 0 and doRemoveItem(getTileItemById({x = pos.x, y = pos.y, z = pos.z}, 1285).uid, 1) or true
end

function onStepIn(cid, item, position, fromPosition)
	doTeleportThing(cid, {x = 32826, y = 32273, z = 12})
	doSendMagicEffect({x = 32826, y = 32273, z = 12}, CONST_ME_EXPLOSIONAREA)
	doCreateItem(1285, 1, {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z})
	addEvent(removeStone, 10 * 1000, fromPosition)
	return true
end