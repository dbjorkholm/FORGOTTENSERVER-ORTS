function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5132 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.PitsOfInferno.ShortcutLevers) >= 1 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5133)
	end
	return true
end