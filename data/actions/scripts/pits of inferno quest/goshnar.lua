function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 2023) then
		if(getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE}).type == 2) then
			doTeleportThing(cid, {x = toPosition.x, y = toPosition.y, z = toPosition.z + 1})
			doSendMagicEffect({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1}, CONST_ME_TELEPORT)
			doTransformItem(item.uid, item.itemid, 0)
		end
	end
	return true
end