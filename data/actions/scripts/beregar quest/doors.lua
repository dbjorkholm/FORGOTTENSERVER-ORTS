local doors = {
	{storage = Storage.hiddenCityOfBeregar.JusticeForAll, value = 6}
	{storage = Storage.hiddenCityOfBeregar.SweetAsChocolateCake, value = 3}
	{storage = Storage.hiddenCityOfBeregar.TheGoodGuard, value = 3}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1225 then
		return true
	end

	local player = Player(cid)
	for i = 1, #doors do
		if player:getStorageValue(doors[i].storage) == doors[i].value then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(1226)
		end
	end
	return true
end
