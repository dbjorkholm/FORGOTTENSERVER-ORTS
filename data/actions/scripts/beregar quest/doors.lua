function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	local config = {
	{door = 50098, value = player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 6}
	{door = 50099, value = player:getStorageValue(Storage.hiddenCityOfBeregar.SweetAsChocolateCake) == 3}
	}
	
	for i, #config do
		if config.door and config.value then
			if item.itemid == 1225 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(1226)
			end
		end
	end
	return true
end
