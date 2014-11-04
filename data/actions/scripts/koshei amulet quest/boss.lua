function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 8272 then
		if player:getStorageValue(Storage.SweetyCyclops.AmuletStatus) == 2 and player:getStorageValue(Storage.KosheiTheDeathless.RewardDoor) ~= 1 then
			player:removeItem(8266, 1)
			player:setStorageValue(Storage.KosheiTheDeathless.RewardDoor, 1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:say("At last.. I have it back, my precious amulet. I am glad you didn't use it! I allow you to ...ahh... enter door ...ahh", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end
	end
	return true
end