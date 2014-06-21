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

local enchantableGems = {2147, 2146, 2149, 2150}
local enchantableItems = {2383, 7383, 7384, 7406, 7402, 2429, 2430, 7389, 7380, 2454, 2423, 2445, 7415, 7392, 2391, 2544, 8905}

local enchantingAltars = {
        {7504, 7505, 7506, 7507},
        {7508, 7509, 7510, 7511},
        {7516, 7517, 7518, 7519},
        {7512, 7513, 7514, 7515}
}

local enchantedGems = {7760, 7759, 7761, 7762}
local enchantedItems = {
        [2383] = {7744, 7763, 7854, 7869},
        [7383] = {7745, 7764, 7855, 7870},
        [7384] = {7746, 7765, 7856, 7871},
        [7406] = {7747, 7766, 7857, 7872},
        [7402] = {7748, 7767, 7858, 7873},
        [2429] = {7749, 7768, 7859, 7874},
        [2430] = {7750, 7769, 7860, 7875},
        [7389] = {7751, 7770, 7861, 7876},
        [7380] = {7752, 7771, 7862, 7877},
        [2454] = {7753, 7772, 7863, 7878},
        [2423] = {7754, 7773, 7864, 7879},
        [2445] = {7755, 7774, 7865, 7880},
        [7415] = {7756, 7775, 7866, 7881},
        [7392] = {7757, 7776, 7867, 7882},
        [2391] = {7758, 7777, 7868, 7883},
        [2544] = {7840, 7839, 7850, 7838},
        [8905] = {8906, 8907, 8909, 8908}
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
