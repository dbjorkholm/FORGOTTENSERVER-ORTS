function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 6261 then
		return true
	end

	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 33 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(6262)
	end
	return true
end