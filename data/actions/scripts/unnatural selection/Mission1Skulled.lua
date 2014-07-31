function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.UnnaturalSelection.Mission01) == 1 then
		player:setStorageValue(Storage.UnnaturalSelection.Mission01, 2) -- Questlog, Unnatural Selection Quest "Mission 1: Skulled"
		player:addItem(11076, 1)
		player:say("You dig out a skull from the pile of bones. That must be the skull Lazaran talked about.", TALKTYPE_MONSTER_SAY)
	end
	return true
end
