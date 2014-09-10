function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1255 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(BlueDjinn.MissionStart + 3) >= 2 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(1256)
	end
	return true
end