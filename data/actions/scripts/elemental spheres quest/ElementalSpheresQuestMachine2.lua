function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (isInRange(toPosition, {x=33238, y=31806, z=12}, {x=33297, y=31865, z=12}) == false) then 
		return false
	end
	if (isInArray({7913, 7914}, item.itemid) == TRUE) then
		toPosition.y = toPosition.y + (item.itemid == 7913 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7913 and 7914 or 7913)
		doTransformItem(get.uid, get.itemid + 4)
		doTransformItem(item.uid, item.itemid + 4)
		doCreatureSay(cid, "ON", TALKTYPE_MONSTER_SAY, false, cid, (toPosition or getCreaturePosition(cid)))
	else
		toPosition.y = toPosition.y + (item.itemid == 7917 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7917 and 7918 or 7917)
		doTransformItem(get.uid, get.itemid - 4)
		doTransformItem(item.uid, item.itemid - 4)
		doCreatureSay(cid, "OFF", TALKTYPE_MONSTER_SAY, false, cid, (toPosition or getCreaturePosition(cid)))
	end	
	return TRUE
end