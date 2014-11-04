function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 5114 then
		return true
	end

	if player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= 4 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5115)
	end
	return true
end