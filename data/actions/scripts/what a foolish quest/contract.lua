function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid ~= 7492 then
		return false
	end

	if player:getStorageValue(Storage.WhatAFoolishQuest.Contract) ~= 1 then
		return false
	end

	player:say('You sign the contract', TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	Item(item.uid):remove()
	Item(itemEx.uid):transform(7491)
	return true
end
