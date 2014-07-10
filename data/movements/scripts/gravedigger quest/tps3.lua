function onStepIn(cid, item, position)

local dormitori = Position(33018, 32437, 10)
local dormitori2 = Position(33015, 32440, 10)
local player = Player(cid)
local creature = Creature(cid)

	if item.actionid == 4534 and (player:getStorageValue(9931) == 1) and (player:getStorageValue(9932) < 1) then
		player:setStorageValue(9932,1)
		creature:teleportTo(dormitori2)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You should hurry, try not to dwell here any longer than a few minutes.')
		dormitori2:sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(dormitori)
		dormitori:sendMagicEffect(CONST_ME_POFF)
	end
	
	if item.actionid == 4535 then
		creature:teleportTo(dormitori)
		dormitori:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
