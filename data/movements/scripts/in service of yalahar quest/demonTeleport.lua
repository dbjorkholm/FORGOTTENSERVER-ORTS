local teleport = {
	[3103] = {action = 1, {x = 32861, y = 31061, z = 9}, {x = 32859, y = 31056, z = 9}},
	[3104] = {action = 0, {x = 32856, y = 31055, z = 9}},
	[3105] = {action = 1, {x = 32888, y = 31045, z = 9}, {x = 32894, y = 31044, z = 9}},
	[3106] = {action = 0, {x = 32894, y = 31046, z = 9}},
}

function onStepIn(cid, item, position, lastPosition)
	if(teleport[item.uid].action == 1) then
		if(getTileItemById(teleport[item.uid][3], 8303).uid > 0) then
			doRemoveItem(getTileItemById(teleport[item.uid][3], 8303).uid, 1)
			doTeleportThing(cid, teleport[item.uid][2])
			doSendMagicEffect(teleport[item.uid][2], CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
			doSendMagicEffect(lastPosition, CONST_ME_ENERGY)
			doCreatureSay(cid, "You may not enter without a sacrifice of a energy soil.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
