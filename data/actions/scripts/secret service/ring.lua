function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 12563 and player:getStorageValue(Storage.secretService.TBIMission05) == 1 then
		player:setStorageValue(Storage.secretService.TBIMission05, 2)
		Item(item.uid):remove()
		player:say('You have placed the false evidence!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
