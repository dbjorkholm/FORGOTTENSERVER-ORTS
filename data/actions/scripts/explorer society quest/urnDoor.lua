function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 3542 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(90) >= 27 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(3343)
	end
	return true
end