function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.GhostShipQuest) == 1 then
		return false
	end

	player:setStorageValue(Storage.GhostShipQuest, 1)
	player:addItem(2463, 1)
	return true
end