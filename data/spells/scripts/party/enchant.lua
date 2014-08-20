local combat = Combat()
local area = createCombatArea(AREA_CROSS5X5)
combat:setArea(area)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 3)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 2 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 1)

function onCastSpell(creature, var)
	local cid = creature:getId()
	local pos = creature:getPosition()
	local membersList = getPartyMembers(cid)
	local player = Player(cid)
	if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
		player:sendCancelMessage("No party members in range.")
		pos:sendMagicEffect(CONST_ME_POFF)
		return LUA_ERROR
	end

	local affectedList = {}
	for _, pid in ipairs(membersList) do
		if getDistanceBetween(Creature(pid):getPosition(), pos) <= 36 then
			table.insert(affectedList, pid)
		end
	end

	local tmp = #affectedList
	if(tmp <= 1) then
		player:sendCancelMessage("No party members in range.")
		pos:sendMagicEffect(CONST_ME_POFF)
		return LUA_ERROR
	end

	local mana = math.ceil((0.9 ^ (tmp - 1) * 120) * tmp)
	if player:getMana() < mana then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		pos:sendMagicEffect(CONST_ME_POFF)
		return LUA_ERROR
	end

	if not combat:execute(creature, var) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		pos:sendMagicEffect(CONST_ME_POFF)
		return LUA_ERROR
	end

	player:addMana(-(mana - 120), false)
	player:addManaSpent((mana - 120) * configManager.getNumber(configKeys.RATE_MAGIC))
	for _, pid in ipairs(affectedList) do
		Player(pid):addCondition(condition)
	end

	return LUA_NO_ERROR
end
