function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5114 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(67) >= 4 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5115)
	end
	return true
end