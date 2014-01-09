local t = {
	[1] = {x=33183, y=32197, z=13},
	[2] = {x=33331, y=32076, z=13},
	[3] = {x=33265, y=32202, z=13},
	[4] = {x=33087, y=32096, z=13}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (isInArray({7911, 7912}, item.itemid) == TRUE) then
		if (isInArray({33268, 33269}, toPosition.x) == TRUE and toPosition.y == 31830 and toPosition.z == 10 and getPlayerStorageValue(cid, 10002) >= 20) then
			local v = getPlayerVocation(cid)
			if v > 4 then
				v = v - 4
			end
			setPlayerStorageValue(cid, 10002, getPlayerStorageValue(cid, 10002) - 20)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, t[v])
			doSendMagicEffect(t[v], CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7911 and 7912 or 7911)
		doTransformItem(get.uid, get.itemid + 4)
		doTransformItem(item.uid, item.itemid + 4)
		doCreatureSay(cid, "ON", TALKTYPE_ORANGE_1, false, cid, (toPosition or getCreaturePosition(cid)))
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7915 and 7916 or 7915)
		doTransformItem(get.uid, get.itemid - 4)
		doTransformItem(item.uid, item.itemid - 4)
		doCreatureSay(cid, "OFF", TALKTYPE_ORANGE_1, false, cid, (toPosition or getCreaturePosition(cid)))
	end	
	return TRUE
end