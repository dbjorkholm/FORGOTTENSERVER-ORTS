local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
			
function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 7816) then
		random = math.random(1, 5)
		if(random == 1) then
			doTeleportThing(cid, lastPosition)
		elseif(random == 2) then
			doMoveCreature(cid, SOUTH)
		elseif(random == 3) then
			doAddCondition(cid, condition)
		end
	elseif(item.actionid == 7817) then
		setPlayerStorageValue(cid, 900, 11)
		doTeleportThing(cid, {x = 32760, y = 31811, z = 10})
		doSendMagicEffect({x = 32760, y = 31811, z = 10}, CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You passed endurance test.")
	elseif(item.actionid == 7818) then
		if(getPlayerStorageValue(cid, 900) == 10) then
			doTeleportThing(cid, {x = 32759, y = 31811, z = 11})
			doSendMagicEffect({x = 32759, y = 31811, z = 11}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
		end
	end
	return true
end
