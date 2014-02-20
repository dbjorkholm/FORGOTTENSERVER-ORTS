local useWorms = FALSE
local waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}
local iceholeIds = {7236}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local i = Item(itemEx.uid)
local p = Player(cid)
	if isInArray(waterIds, itemEx.itemid) == TRUE then
		if itemEx.itemid ~= 493 then
			if useWorms == FALSE or useWorms == TRUE and p:doPlayerRemoveItem(ITEM_WORM, 1) == TRUE then
				if math.random(1, (100 + (p:getPlayerSkill(SKILL_FISHING) / 10))) <= p:getPlayerSkill(SKILL_FISHING) then
					p:doPlayerAddItem(ITEM_FISH, 1)
				end
				p:doPlayerAddSkillTry(SKILL_FISHING, 1)
			end
		end
		toPosition:doSendMagicEffect(CONST_ME_LOSEENERGY)
		return TRUE
	elseif isInArray(iceholeIds, itemEx.itemid) == TRUE then -- fish in icehole --
		if useWorms == FALSE or useWorms == TRUE and p:doPlayerRemoveItem(ITEM_WORM, 1) == TRUE then
			if math.random(1, (100 + (p:getPlayerSkill(SKILL_FISHING) / 10))) <= p:getPlayerSkill(SKILL_FISHING) then
				local rand = math.random(1, 100)
				if(rand > 98) then
					p:doPlayerAddItem(7158, 1) -- rainbow trout 2% --
				elseif(rand > 95) then
					p:doPlayerAddItem(2669, 1) -- Northern Pike 3% --
				elseif(rand > 89) then
					p:doPlayerAddItem(7159, 1) -- Green Perch 6% --
				else
					p:doPlayerAddItem(ITEM_FISH, 1) -- normal fish --
				end
				p:doPlayerAddSkillTry(SKILL_FISHING, 1)
				i:transform(7237)
				i:decay()
			end
			toPosition:doSendMagicEffect(CONST_ME_LOSEENERGY)
			return TRUE
		end
	end
	return FALSE
end
