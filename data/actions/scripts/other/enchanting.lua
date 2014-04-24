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
	local iex = Item(itemEx.uid)
	local iuid = Item(item.uid)
	local p = Player(cid)
	if(item.itemid == 2147 and itemEx.itemid == 2342) then
		iex:transform(2343)
		iex:decay()
		iuid:remove(1)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	end

	if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
		iex:transform(9933)
		iuid:remove(1)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	end

	if(isInArray(enchantableGems, item.itemid)) then
		local subtype = item.type
		if(subtype == 0) then
			subtype = 1
		end

		local mana = config.manaCost * subtype
		if(p:getMana() < mana) then
			p:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
			return true
		end

		local soul = config.soulCost * subtype
		if(p:getSoul() < soul) then
			p:sendCancelMessage(RETURNVALUE_NOTENOUGHSOUL)
			return true
		end

		local a = table.find(enchantableGems, item.itemid)
		if(a == nil or not(isInArray(enchantingAltars[a], itemEx.itemid))) then
			return false
		end

		p:addMana(-mana)
		p:addSoul(-soul)
		iuid:transform(enchantedGems[a])
		p:addManaSpent(mana * configManager.getNumber(configKeys.RATE_MAGIC))
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	end
 
	if(isInArray(enchantedGems, item.itemid)) then
		if(not(isInArray(enchantableItems, itemEx.itemid))) then
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			return false
		end

		local b = table.find(enchantedGems, item.itemid)
		if(b == nil) then
			return false
		end

		local subtype = itemEx.type
		if(not(isInArray({2544, 8905}, itemEx.itemid))) then
			subtype = 1000
		end

		iex:transform(enchantedItems[itemEx.itemid][b], subtype)
		getThingPos(itemEx.uid):sendMagicEffect(CONST_ME_MAGIC_RED)
		iuid:remove(1)
		return true
	end
return false
end
