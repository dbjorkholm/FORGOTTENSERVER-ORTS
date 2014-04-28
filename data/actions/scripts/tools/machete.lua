local JUNGLE_GRASS = { 2782, 3985, 19433 }
local SPIDER_WEB = { 7538, 7539 }
local BAMBOO_FENCE = { 3798, 3799 }
local WILD_GROWTH = { 1499, 11099 }

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	if(isInArray(JUNGLE_GRASS, itemEx.itemid)) then
		targetItem:transform(itemEx.itemid == 19433 and 19431 or itemEx.itemid - 1)
		targetItem:decay()
		return true
	end

	if(isInArray(SPIDER_WEB, itemEx.itemid)) then
		if math.random(3) == 1 then
			targetItem:transform(itemEx.itemid + 6)
			targetItem:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if(isInArray(BAMBOO_FENCE, itemEx.itemid)) then
		if math.random(3) == 1 then
			if(itemEx.itemid == BAMBOO_FENCE[1]) then
				targetItem:transform(itemEx.itemid + 161)
			elseif(itemEx.itemid == BAMBOO_FENCE[2]) then
				targetItem:transform(itemEx.itemid + 159)
			end
			targetItem:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if(isInArray(WILD_GROWTH, itemEx.itemid)) then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		targetItem:remove()
		return true
	end
	
	return destroyItem(cid, itemEx, toPosition)
end
