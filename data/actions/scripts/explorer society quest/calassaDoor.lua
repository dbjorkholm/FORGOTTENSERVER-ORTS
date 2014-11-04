function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 5748 then
		return true
	end

	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 63 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5749)
	end
	return true
end