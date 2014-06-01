function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 8266 and itemEx.itemid == 8272) then
		if(getPlayerStorageValue(cid, 49) == 2 and getPlayerStorageValue(cid, 47) < 1) then
			player:removeItem(8266, 1)
			setPlayerStorageValue(cid, 47, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
			doCreatureSay(cid, "At least I have it back, my precious amulet. I am glad you didn't use it! I allow you to ...ahh... enter door ...ahh", TALKTYPE_ORANGE_1, false, cid, toPosition)
		end
	end
	return true
end