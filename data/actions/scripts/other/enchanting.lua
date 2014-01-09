local config = {
	manaCost = 300,
	soulCost = 2,
}

local spheres = {
	[7759] = {3, 7},
	[7760] = {1, 5},
	[7761] = {2, 6},
	[7762] = {4, 8}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (isInArray({33268, 33269}, toPosition.x) == TRUE and toPosition.y == 31830 and toPosition.z == 10 and getPlayerStorageValue(cid, 10000) >= 1) then
		if isInArray(spheres[item.itemid], getPlayerVocation(cid)) ~= TRUE then
			return FALSE
		elseif isInArray({7915, 7916}, itemEx.itemid) == TRUE then
			doCreatureSay(cid, 'Turn off the machine first.', TALKTYPE_ORANGE_1)
			return TRUE
		elseif (getPlayerStorageValue(cid, 10002) >= 20) then
			return (doCreatureSay(cid, 'You can now use the machine!', TALKTYPE_ORANGE_1))		
		else
			setPlayerStorageValue(cid, 10002, math.max(1, getPlayerStorageValue(cid, 10002) + 1))
			doSendMagicEffect(toPosition, CONST_ME_PURPLEENERGY)
			doRemoveItem(item.uid, 1)
			return TRUE
		end
	end

	if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, 9933)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(item.itemid == 7761 and isInArray({9949, 9954}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid - 1)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		return true
	end

	if(isInArray(enchantableGems, item.itemid)) then
		local subtype = item.type
		if(subtype == 0) then
			subtype = 1
		end

		local mana = config.manaCost * subtype
		if(getPlayerMana(cid) < mana) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
			return true
		end

		local soul = config.soulCost * subtype
		if(getPlayerSoul(cid) < soul) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
			return true
		end

		local a = table.find(enchantableGems, item.itemid)
		if(a == nil or not isInArray(enchantingAltars[a], itemEx.itemid)) then
			return false
		end

		doPlayerAddMana(cid, -mana)
		doPlayerAddSoul(cid, -soul)

		doTransformItem(item.uid, enchantedGems[a])
		if(not getPlayerFlagValue(cid, PlayerFlag_NotGainMana)) then
			doPlayerAddMana(cid, -mana)
		end

		doSendMagicEffect(fromPosition, CONST_ME_HOLYDAMAGE)
		return true
	end
 
	if(isInArray(enchantedGems, item.itemid)) then
		if(not isInArray(enchantableItems, itemEx.itemid)) then
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			return false
		end

		local b = table.find(enchantedGems, item.itemid)
		if(b == nil) then
			return false
		end

		local subtype = itemEx.type
		if(not isInArray({2544, 8905}, itemEx.itemid)) then
			subtype = 1000
		end

		doTransformItem(itemEx.uid, enchantedItems[itemEx.itemid][b], subtype)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HOLYDAMAGE)
		doDecayItem(itemEx.uid)

		doRemoveItem(item.uid, 1)
		return true
	end

	return false
end
