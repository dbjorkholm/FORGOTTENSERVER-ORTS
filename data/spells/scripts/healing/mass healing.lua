local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onTargetCreature(cid, target)
	local player = Player(cid)
	local min = ((player:getLevel() / 5) + (player:getMagicLevel() * 4.6) + 100)
	local max = ((player:getLevel() / 5) + (player:getMagicLevel() * 9.6) + 125)

	local targetCreature = Creature(target)
	local master = targetCreature:getMaster()
	if targetCreature:isMonster() and not master
			or master and master:isMonster() then
		return true
	end

	doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
