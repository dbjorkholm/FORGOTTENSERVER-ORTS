function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid ~= 7481 then
		return false
	end

	if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 8 then
		return false
	end

	player:getPosition():sendMagicEffect(CONST_ME_SOUND_GREEN)
	player:say('Your innocent whistle will fool them all...', TALKTYPE_MONSTER_SAY)
	toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
	Item(item.uid):transform(item.itemid + 1)
	return true
end
