function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1223 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Rashid.MissionStart + 1) >= 3 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(1224)
	end
	return true
end