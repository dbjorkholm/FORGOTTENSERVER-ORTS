function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 3542 then
		return true
	end

	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 27 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(3343)
	end
	return true
end