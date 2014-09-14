function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1257 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) >= 2 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(1258)
	end
	return true
end