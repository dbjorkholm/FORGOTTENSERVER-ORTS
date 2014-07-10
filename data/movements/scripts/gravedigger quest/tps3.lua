local dormitori = Position(33018, 32437, 10)
local dormitori2 = Position(33015, 32440, 10)

function onStepIn(cid, item, position)
	local player = Player(cid)

	if not player then
		return true
	end

	if item.actionid == 4534 and player:getStorageValue(9931) == 1 and player:getStorageValue(9932) < 1 then
		player:setStorageValue(9932,1)
		player:teleportTo(dormitori2)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You should hurry, try not to dwell here any longer than a few minutes.')
		dormitori2:sendMagicEffect(CONST_ME_POFF)
	else
		player:teleportTo(dormitori)
		dormitori:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
