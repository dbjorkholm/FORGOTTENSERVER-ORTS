function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 9032) then
		doTransformItem(getTileItemById({x = 32836, y = 32288, z = 14}, 1387).uid, 6299)
		doTransformItem(getTileItemById({x = 32834, y = 32285, z = 14}, 1946).uid, 1945)
		doTeleportThing(cid, {x = 32874, y = 32275, z = 14})
		doSendMagicEffect({x = 32874, y = 32275, z = 14}, CONST_ME_TELEPORT)
	end
	return true
end