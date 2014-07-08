function catchPlayer(cid)
	setPlayerStorageValue(cid, 1062, 1)
	doTeleportThing(cid, {x = 33356, y = 31206, z = 8})
	doCreatureSay(cid, "The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.", TALKTYPE_ORANGE_1)
	return true
end

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) then
		if(item.actionid == 8015) then
			doCreatureSay(cid, "You hear guards moving behind doors in the distance. If you have any sort of disguise with you, this is the moment to use it.", TALKTYPE_ORANGE_1)
		elseif(item.actionid == 8016) then
			if(getTileItemById({x = getPlayerPosition(cid).y < 31094 and 33080 or 33385, y = getPlayerPosition(cid).y, z = 8}, 12213).uid > 0) then
				catchPlayer(cid)
			end
		elseif(item.actionid == 8017 or item.itemid == 11436) then
			catchPlayer(cid)
		elseif(item.actionid == 8018) then
			if(getGlobalStorageValue(8018) == 1) then
				catchPlayer(cid)
			end
		elseif(item.actionid == 8019) then
			if(getGlobalStorageValue(8019) == 1) then
				catchPlayer(cid)
			end
		elseif(item.actionid == 8020) then
			if(getGlobalStorageValue(8020) == 1) then
				catchPlayer(cid)
			end
		elseif(item.actionid == 8021) then
			doCreatureSay(cid, "Guards heavily patrol this area. Try to stay hidden and do not draw any attention to yourself by trying to attack.", TALKTYPE_ORANGE_1)
		elseif(item.actionid == 8022) then
			if(getPlayerStorageValue(cid, 1068) < 1) then
				catchPlayer(cid)
			end
		elseif(item.actionid == 8023) then
			setPlayerStorageValue(cid, 1068, 0)
			doSetCreatureOutfit(cid, {lookTypeEx = 12496}, 1)
		end
	end
	return true
end
