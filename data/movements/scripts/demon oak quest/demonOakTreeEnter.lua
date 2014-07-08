local enterPosition = {x=32716, y=32347, z=7}
local kickPosition = {x=32716, y=32340, z=7}
local enter_storage = 1013
local squarestorage = 1014

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local player = Player(cid)
	if not player then
		returen true
	end

	if player:getStorageValue(1010) < 1 then
		if player:getLevel() >= 120 then
			if player:getStorageValue(squarestorage) == 5 and (not isPlayerInArea({x = 32706, y = 32345, z = 7, stackpos = 255}, {x = 32725, y = 32357, z = 7, stackpos = 255})) then
				player:teleportTo(enterPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(1011, 1)
				player:setStorageValue(enter_storage, 1)
				player:say("I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
			else
				player:teleportTo(kickPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		else
			player:say("LEAVE LITTLE FISH, YOU ARE NOT WORTH IT!", TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
			player:teleportTo(kickPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		player:teleportTo(kickPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
