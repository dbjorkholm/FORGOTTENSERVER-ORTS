function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 4633 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission17) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission19) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission19, 1)
			player:addItem(21406, 1)
			Item(item.uid):remove()
		end
	end
	return true
end