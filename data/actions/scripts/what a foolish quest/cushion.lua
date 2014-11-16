function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid ~= 4203 then
		return false
	end

	if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 17
			or player:getStorageValue(Storage.WhatAFoolishQuest.WhoopeeCushion) == 1 then
		return false
	end

	player:setStorageValue(Storage.WhatAFoolishQuest.WhoopeeCushion, 1)
	player:say('*chuckles maniacally*', TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:say('Woooosh!', TALKTYPE_MONSTER_SAY, false, player, toPosition)
	Item(item.uid):remove()
	return true
end
