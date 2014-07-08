local enterPosition = {x=32716, y=32347, z=7}
local kickPosition = {x=32716, y=32340, z=7}
local enter_storage = 1013
local squarestorage = 1014

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
 	if (isPlayer(cid)) then
		if (getPlayerStorageValue(cid, 1010) < 1) then
			if (getPlayerLevel(cid) >= 120) then
				if (getPlayerStorageValue(cid, squarestorage) == 5) and (not isPlayerInArea({x = 32706, y = 32345, z = 7, stackpos = 255}, {x = 32725, y = 32357, z = 7, stackpos = 255})) then
					doTeleportThing(cid, enterPosition)
					doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
					setPlayerStorageValue(cid, 1011, 1)
					setPlayerStorageValue(cid, enter_storage, 1)
					doCreatureSay(cid, "I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or getCreaturePosition(cid)))
				else
					doTeleportThing(cid, kickPosition)
		  			doSendMagicEffect(kickPosition, CONST_ME_TELEPORT)
				end
			else
				doCreatureSay(cid, "LEAVE LITTLE FISH, YOU ARE NOT WORTH IT!", TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or getCreaturePosition(cid)))
		   		doTeleportThing(cid, kickPosition)
		  		doSendMagicEffect(kickPosition, CONST_ME_TELEPORT)
			end
		else
			doTeleportThing(cid, kickPosition)
		  	doSendMagicEffect(kickPosition, CONST_ME_TELEPORT)
		end
	end
	return true
end
