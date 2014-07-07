local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setConditionFormula(condition, -0.9, 0, -0.9, 0)

local player = Player(cid)
			
function onStepIn(cid, item, position, lastPosition)
	if item.actionid == 7816 then
		random = math.random(1, 5)
		if random == 1 then
			player:teleportTo(lastPosition)
		elseif random == 2 then
			player:moveTo(SOUTH)
		elseif random == 3 then
			player:addCondition(condition)
		end
	elseif item.actionid == 7817 then
		player:setStorageValue(900, 11)
		player:teleportTo(Position(32760, 31811, 10))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You passed endurance test.")
	elseif item.actionid == 7818 then
		if getPlayerStorageValue(cid, 900) == 10 then
			player:teleportTo(Position(32759, 31811, 11))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(lastPosition)
		end
	end
	return true
end
