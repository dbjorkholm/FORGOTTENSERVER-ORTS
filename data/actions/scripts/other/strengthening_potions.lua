local berserker = Condition(CONDITION_ATTRIBUTES)
berserker:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserker:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserker:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 7439 then
		if not doTargetCombatCondition(0, cid, berserker, CONST_ME_MAGIC_RED) then
			return false
		end
	elseif item.itemid == 7440) then
		if not (isSorcerer(cid) or isDruid(cid)) then
			Player(cid):say("Only sorcerers and druids may drink this fluid.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatCondition(0, cid, mastermind, CONST_ME_MAGIC_RED) then
			return false
		end
	elseif item.itemid == 7443 then
		if not doTargetCombatCondition(0, cid, bullseye, CONST_ME_MAGIC_RED) then
			return false
		end	
	end
	
	Item(item.uid):remove(1)
	return true
end
