function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.itemid == 8266 and itemEx.itemid == 8272) then
		if(player:getStorageValue(49) == 2 and player:getStorageValue(3066) < 1) then
			player:removeItem(8266, 1)
			player:setStorageValue(3066, 1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:say("At last.. I have it back, my precious amulet. I am glad you didn't use it! I allow you to ...ahh... enter door ...ahh", TALKTYPE_ORANGE_1, false, cid, toPosition)
		end
	end
	return true
end