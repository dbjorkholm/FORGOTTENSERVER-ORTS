function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 8272 then
		local player = Player(cid)
		if player:getStorageValue(49) == 2 and player:getStorageValue(3066) ~= 1 then
			player:removeItem(8266, 1)
			player:setStorageValue(3066, 1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:say("At last.. I have it back, my precious amulet. I am glad you didn't use it! I allow you to ...ahh... enter door ...ahh", TALKTYPE_MONSTER_SAY, false, cid, toPosition)
		end
	end
	return true
end