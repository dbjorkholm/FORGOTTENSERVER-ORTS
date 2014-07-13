local spheres = {
	[8300] = {3, 7},
	[8304] = {1, 5},
	[8305] = {2, 6},
	[8306] = {4, 8}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (isInArray({7917, 7918, 7913, 7914}, itemEx.itemid) == FALSE) then return false end
	if (isInRange(toPosition, {x=33238, y=31806, z=12}, {x=33297, y=31865, z=12}) == TRUE) then
		if isInArray(spheres[item.itemid], getPlayerVocation(cid)) ~= TRUE then
			return FALSE
		elseif isInArray({7917, 7918}, itemEx.itemid) == TRUE then
			return (doCreatureSay(cid, 'Turn off the machine first.', TALKTYPE_MONSTER_SAY))		
		else
			doSendMagicEffect(toPosition, CONST_ME_PURPLEENERGY)
			if isSorcerer(cid) then
				setGlobalStorageValue(10005, 1)
			elseif isDruid(cid) then
				setGlobalStorageValue(10006, 1)
			elseif isPaladin(cid) then
				setGlobalStorageValue(10007, 1)
			elseif isKnight(cid) then
				setGlobalStorageValue(10008, 1)
			end
			doRemoveItem(item.uid, 1)
			return TRUE
		end
	end
	return true
end