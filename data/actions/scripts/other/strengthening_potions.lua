local berserker = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(berserker, CONDITION_PARAM_TICKS, 10 * 60 * 1000)
setConditionParam(berserker, CONDITION_PARAM_SKILL_MELEE, 5)
setConditionParam(berserker, CONDITION_PARAM_SKILL_SHIELD, -10)

local mastermind = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(mastermind, CONDITION_PARAM_TICKS, 10 * 60 * 1000)
setConditionParam(mastermind, CONDITION_PARAM_STAT_MAGICPOINTS, 3)
setConditionParam(mastermind, CONDITION_PARAM_SKILL_SHIELD, -10)

local bullseye = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(bullseye, CONDITION_PARAM_TICKS, 30 * 60 * 1000)
setConditionParam(bullseye, CONDITION_PARAM_SKILL_DISTANCE, 5)
setConditionParam(bullseye, CONDITION_PARAM_SKILL_SHIELD, -10)

function onUse(cid, item, frompos, item2, topos)
	local c = Creature(cid)
	local i = Item(item.uid)
	if(item.itemid == 7439) then
		if(doTargetCombatCondition(0, cid, berserker, CONST_ME_MAGIC_RED) == LUA_ERROR) then
			return false
		end
	elseif(item.itemid == 7440) then
		if(not(isSorcerer(cid) or isDruid(cid))) then
			c:say("Only sorcerers and druids may drink this fluid.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if(doTargetCombatCondition(0, cid, mastermind, CONST_ME_MAGIC_RED) == LUA_ERROR) then
			return false
		end
	elseif(item.itemid == 7443) then
		if(doTargetCombatCondition(0, cid, bullseye, CONST_ME_MAGIC_RED) == LUA_ERROR) then
			return false
		end	
	end
	i:remove(1)
return true
end
