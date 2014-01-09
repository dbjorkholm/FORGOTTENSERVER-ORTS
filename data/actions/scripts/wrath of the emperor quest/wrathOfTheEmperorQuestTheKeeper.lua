function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 12320 and itemEx.actionid == 8026) then
		if(getGlobalStorageValue(8026) < 5) then
			setGlobalStorageValue(8026, getGlobalStorageValue(8026) < 0 and 0 or getGlobalStorageValue(8026) + 1)
			doCreatureSay(cid, "The plant twines and twiggles even more than before, it almost looks as it would scream great pain.", TALKTYPE_ORANGE_1) 
		elseif(getGlobalStorageValue(8026) == 5) then
			setGlobalStorageValue(8026, 6)
			doSendMagicEffect(toPosition, CONST_ME_YELLOWRINGS)
			doSummonCreature("the keeper", {x = 33171, y = 31058, z = 11})
			doSendMagicEffect({x = 33171, y = 31058, z = 11}, CONST_ME_TELEPORT)
		end
	elseif(item.itemid == 12316) then
		if(getPlayerStorageValue(cid, 1060) == 7) then
			setPlayerStorageValue(cid, 1060, 8)
			doPlayerAddItem(cid, 12323, 1)
		end
	end
	return true
end
