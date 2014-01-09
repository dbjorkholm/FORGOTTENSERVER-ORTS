function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 3323 and item.itemid == 7243) then
		if(getPlayerStorageValue(cid, 121) == 6) then
			doSendMagicEffect(toPosition, CONST_ME_GROUNDSHAKER)
			setPlayerStorageValue(cid, 121, 7)
			doCreatureSay(cid, "You fill the jug with ants.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 7244)
		end
	elseif(itemEx.itemid == 4942 and item.itemid == 7244 and itemEx.itemid == 100) then
		if(getPlayerStorageValue(cid, 121) == 7) then
			doSendMagicEffect(toPosition, CONST_ME_GROUNDSHAKER)
			setPlayerStorageValue(cid, 121, 8)
			doCreatureSay(cid, "You released ants on the hill.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 7243)
		end
	end
	return true
end