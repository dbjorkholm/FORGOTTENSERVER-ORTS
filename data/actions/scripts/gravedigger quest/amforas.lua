function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9995) == 1) and (getPlayerStorageValue(cid, 9996) < 1) then
		local chances=math.random(30)
		if chances == 13 then
			setPlayerStorageValue(cid,9996,1)
			doCreatureSay(cid, "You've got an amazing heart!", TALKTYPE_ORANGE_1)
			doSendMagicEffect(getCreaturePosition(cid),CONST_ME_HEARTS)
			doPlayerAddItem(cid,21394,1)
		else
			doCreatureSay(cid, "Keep it trying!", TALKTYPE_ORANGE_1)
			doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
		end
	else
		doCreatureSay(cid, "You've already got your heart", TALKTYPE_ORANGE_1)
	end
	return true
end