local doors = {
	5290,
	5105,
	1225,
	5114,
	1223,
	5123,
	7049,
	7040,
	9177,
	10791,
	12204,
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.postman.Rank) == 5 then
		if isInArray(doors, item.itemid) then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		end
	end
	return true
end
