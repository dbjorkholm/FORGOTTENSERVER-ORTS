function onStepIn(cid, item, pos)

local dormitori = {x = 33018, y = 32437, z = 10}
local dormitori2 = {x = 33015, y = 32440, z = 10}
local player = Player(cid)
local creature = Creature(cid)

	if item.actionid == 4534 and (player:getStorageValue(9931) == 1) and (player:getStorageValue(9932) < 1) then
		player:setStorageValue(9932,1)
		creature:teleportTo(dormitori2)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You should hurry, try not to dwell here any longer than a few minutes.')
		Position(dormitori2):sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(dormitori)
		Position(dormitori):sendMagicEffect(CONST_ME_POFF)
	end
	
	if item.actionid == 4535 then
		creature:teleportTo(dormitori)
		Position(dormitori):sendMagicEffect(CONST_ME_POFF)
	end
	

end