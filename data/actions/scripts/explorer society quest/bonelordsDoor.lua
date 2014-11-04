function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 5105 then
		return true
	end

	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 30 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5106)
	end
	return true
end