function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid ~= 4204 then
		return false
	end

	if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 34
			or player:getStorageValue(Storage.WhatAFoolishQuest.OldWornCloth) == 1 then
		return false
	end

	player:setStorageValue(Storage.WhatAFoolishQuest.OldWornCloth, 1)
	player:say('Amazing! That was quite fast!', TALKTYPE_MONSTER_SAY)
	toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
	Item(item.uid):transform(7501)
	return true
end
