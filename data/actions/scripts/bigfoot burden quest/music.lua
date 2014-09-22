local cToneStorages = {
	Storage.MelodyTone1,
	Storage.MelodyTone2,
	Storage.MelodyTone3,
	Storage.MelodyTone4,
	Storage.MelodyTone5,
	Storage.MelodyTone6,
	Storage.MelodyTone7
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 12 then
		local value = player:getStorageValue(Storage.BigfootBurden.MelodyStatus)
		if player:getStorageValue(cToneStorages[value]) == item.uid then
			player:setStorageValue(Storage.BigfootBurden.MelodyStatus, value + 1)
			toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
			if value + 1 == 8 then
				player:setStorageValue(Storage.BigfootBurden.QuestLine, 13)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found your melody!")
			end
		else
			player:setStorageValue(Storage.BigfootBurden.MelodyStatus, 1)
			toPosition:sendMagicEffect(CONST_ME_SOUND_RED)
		end
	end
	return true
end
