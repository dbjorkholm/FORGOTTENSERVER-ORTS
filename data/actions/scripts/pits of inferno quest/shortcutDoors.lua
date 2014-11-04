function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid ~= 5132 then
		return true
	end

	if player:getStorageValue(Storage.PitsOfInferno.ShortcutLevers) >= 1 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(5133)
	end
	return true
end