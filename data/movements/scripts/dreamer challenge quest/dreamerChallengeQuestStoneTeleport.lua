function onStepIn(cid, item, position, fromPosition)
	doTeleportThing(cid, {x = 32920, y = 32296, z = 13})
	doSendMagicEffect({x = 32920, y = 32296, z = 13}, CONST_ME_TELEPORT)
 	doTransformItem(getTileItemById({x = 32873, y = 32263, z = 14}, 1946).uid, 1945)
	doTransformItem(getTileItemById(position, 1387).uid, 1355)
	doTransformItem(getTileItemById({x = 32874, y = 32263, z = 14}, 3733).uid, 3729)
	doTransformItem(getTileItemById({x = 32875, y = 32263, z = 14}, 3734).uid, 3730)
	doTransformItem(getTileItemById({x = 32874, y = 32264, z = 14}, 3735).uid, 3731)
	doTransformItem(getTileItemById({x = 32875, y = 32264, z = 14}, 3736).uid, 3732)
	return true
end