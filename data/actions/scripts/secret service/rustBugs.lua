function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.uid == 12579 and player:getStorageValue(Storage.secretService.CGBMission03) == 1 then
		player:setStorageValue(Storage.secretService.CGBMission03, 2)
		Item(item.uid):remove()
		Game.createItem(8016, 1, Position(32909, 32112, 7))
		player:say('The bugs are at work!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
