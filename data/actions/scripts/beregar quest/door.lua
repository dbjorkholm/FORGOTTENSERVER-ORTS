function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 6 then
		if item.itemid == 1225 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(1226)
		end
	end
	return true
end
