function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid ~= 12505 then
		return true
	end

	local player = Player(cid)

	if player:getStorageValue(Storage.thievesGuild.Mission06) == 2 then
		player:removeItem(8762, 1)
		player:say('In your haste you break the key while slipping in.', TALKTYPE_MONSTER_SAY)
		player:teleportTo(Position(32359, 32788, 6))
	end
	return true
end
