function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
		if itemEx.itemid == 7106 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:say('You take some hot water from the geyser.', TALKTYPE_MONSTER_SAY)
			Item(item.uid):transform(7246)
		end
	end
	return true
end