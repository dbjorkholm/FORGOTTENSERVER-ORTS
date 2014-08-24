function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.thievesGuild.Mission06) == 3 then
		player:say('You slip through the door', TALKTYPE_MONSTER_SAY)
		player:teleportTo(Position(32359, 32786, 6))
	end
	return true
end
