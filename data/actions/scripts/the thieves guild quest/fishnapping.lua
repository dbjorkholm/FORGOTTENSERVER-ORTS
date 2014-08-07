function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.thievesGuild.Mission06) < 3 then
		player:addItem(8766, 1)
		player:say('To buy some time you replace the fish with a piece of carrot.', TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.thievesGuild.Mission06, 3)
	end
	return true
end
