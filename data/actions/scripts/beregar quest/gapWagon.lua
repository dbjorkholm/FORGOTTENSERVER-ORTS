function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 1 and Tile(Position(32571, 31508, 9)):getItemId(7122) then
		player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 2)
		player:teleportTo(Position(32578, 31507, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You safely passed the gap but your bridge collapsed behind you.", TALKTYPE_MONSTER_SAY, false, 0, pos)
		Game.removeItem(5779, Position(32571, 31508, 9))
		Game.removeItem(7122, Position(32571, 31508, 9))
	else
		player:teleportTo(Position(32580, 31487, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You need to build a bridge to pass the gap.", TALKTYPE_MONSTER_SAY, false, 0, pos)
	end
	return true
end
