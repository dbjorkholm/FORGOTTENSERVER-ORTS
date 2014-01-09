local pos = {
	[2050] = {text = "You flipped the first level. Hurry up and find the next one!", number = 1},
	[2051] = {text = "You flipped the second level. Hurry up and find the next one!", number = 2},
	[2052] = {text = "You flipped the third level. Hurry up and find the next one!", number = 3},
	[2053] = {text = "You flipped the fourth level. Hurry up and find the next one!", number = 4},
	[2054] = {text = "You flipped the fifth level. Hurry up and find the next one!", number = 5},
	[2055] = {text = "You flipped the sixth level. Hurry up and find the next one!", number = 6},
	[2056] = {text = "You flipped the seventh level. Hurry up and find the next one!", number = 7},
	[2057] = {text = "You flipped the eighth level. Hurry up and find the next one!", number = 8},
	[2058] = {text = "You flipped the ninth level. Hurry up and find the next one!", number = 9},
	[2059] = {text = "You flipped the tenth level. Hurry up and find the next one!", number = 10},
	[2060] = {text = "You flipped the eleventh level. Hurry up and find the next one!", number = 11},
	[2061] = {text = "You flipped the twelfth level. Hurry up and find the next one!", number = 12},
	[2062] = {text = "You flipped the thirteenth level. Hurry up and find the next one!", number = 13},
	[2063] = {text = "You flipped the fourteenth level. Hurry up and find the next one!", number = 14},
	[2064] = {text = "You flipped the fifteenth level. Hurry up and find the next one!", number = 15}
}
 
local stones = {
	{x = 32851, y = 32333, z = 12},
	{x = 32852, y = 32333, z = 12}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2065) then
		if(item.itemid == 1945) then
			if(getGlobalStorageValue(1000) == 15) then
				for i = 1, 2 do
					doRemoveItem(getTileItemById(stones[i], 1304).uid, 1)
					doSendMagicEffect(stones[i], CONST_ME_EXPLOSION)
				end
				doTransformItem(item.uid, 1946)
			else
				doCreatureSay(cid, "The final lever won't budge... yet.", TALKTYPE_ORANGE_1)
			end
			return true
		end
	end
	if(getGlobalStorageValue(1000) < 0) then
		setGlobalStorageValue(1000, 0)
	end
	if(item.itemid == 1945) then
		if((getGlobalStorageValue(1000) + 1) == pos[item.uid].number) then
			setGlobalStorageValue(1000, pos[item.uid].number)
			doCreatureSay(cid, pos[item.uid].text, TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 1946)
		else
			doCreatureSay(cid, "The final lever won't budge... yet.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end