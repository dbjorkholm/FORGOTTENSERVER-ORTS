function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 121) == 21) then
		if((itemEx.itemid == 7108 or itemEx.itemid == 7106) and item.itemid == 7246) then
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doCreatureSay(cid, "You take some hot water from the geyser.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 7286)
		elseif(itemEx.itemid == 7261 and item.itemid == 2566) then
			if(getPlayerStorageValue(cid, 124) < 1) then
				doPlayerAddItem(cid, 7248, 1)
				setPlayerStorageValue(cid, 124, 1)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
				doCreatureSay(cid, "You cut a leaf from a frostbite herb.", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.itemid == 388 and item.itemid == 2565) then
			if(getPlayerStorageValue(cid, 125) < 1) then
				doPlayerAddItem(cid, 8301, 1)
				setPlayerStorageValue(cid, 125, 1)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
				doCreatureSay(cid, "You retrive a fine sulphur from a lava hole.", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.itemid == 2733 and item.itemid == 2566) then
			if(getPlayerStorageValue(cid, 126) < 1) then
				doPlayerAddItem(cid, 7245, 1)
				setPlayerStorageValue(cid, 126, 1)
				doTransformItem(itemEx.uid, 2723)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
				doCreatureSay(cid, "You cut a flower from a cactus.", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.itemid == 4184 and item.itemid == 2565) then
			if(getPlayerStorageValue(cid, 127) < 1) then
				doPlayerAddItem(cid, 7247, 1)
				setPlayerStorageValue(cid, 127, 1)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
				doCreatureSay(cid, "You retrive spores from a mushroom.", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.itemid == 4017 and item.itemid == 2566) then
			if(getPlayerStorageValue(cid, 128) < 1) then
				doPlayerAddItem(cid, 7249, 1)
				setPlayerStorageValue(cid, 128, 1)
				doTransformItem(itemEx.uid, 4014)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
				doCreatureSay(cid, "You cut a flower from a bush.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end