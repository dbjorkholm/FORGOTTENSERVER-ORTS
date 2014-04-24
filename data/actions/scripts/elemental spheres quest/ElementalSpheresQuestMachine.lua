local t = {
	[1] = {x=33183, y=32197, z=13},
	[2] = {x=33331, y=32076, z=13},
	[3] = {x=33265, y=32202, z=13},
	[4] = {x=33087, y=32096, z=13}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 100) then
		return true
	end
	if(isInArray({7911, 7912}, item.itemid)) then
		if(isInArray({33268, 33269}, toPosition.x) and toPosition.y == 31830 and toPosition.z == 10 and Player(cid):getStorageValue(key)(10002) >= 20) then
			local v = Player(cid):getVocation():getId()
			if(v > 4) then
				v = v - 4
			end
			Player(cid):setStorageValue(10002, Player(cid):getStorageValue(key)(10002) - 20)
			Position(getThingPos(cid)):sendMagicEffect(CONST_ME_TELEPORT)
			Position(t[v]):sendMagicEffect(CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7911 and 7912 or 7911)
		doTransformItem(get.uid, get.itemid + 4) -- need to pass to the metatable functions
		doTransformItem(item.uid, item.itemid + 4) -- need to pass to the metatable functions
		Creature(cid):say("ON", TALKTYPE_ORANGE_1, false, cid, (toPosition or getCreaturePosition(cid)))
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local get = getTileItemById(toPosition, item.itemid == 7915 and 7916 or 7915)
		doTransformItem(get.uid, get.itemid - 4) -- need to pass to the metatable functions
		doTransformItem(item.uid, item.itemid - 4) -- need to pass to the metatable functions
		Creature(cid):say("OFF", TALKTYPE_ORANGE_1, false, cid, (toPosition or getCreaturePosition(cid)))
	end	
return true
end
