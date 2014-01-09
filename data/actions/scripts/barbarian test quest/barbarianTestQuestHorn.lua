function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.uid == 7140 and item.itemid == 7140) then
		doCreatureSay(cid, "You fill your horn with ale.", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, 7141)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
	elseif(itemEx.uid == 7141 and item.itemid == 7175) then
			doCreatureSay(cid, "The bear is now unconcious.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 7140)
			doTransformItem(itemEx.uid, 7174)
			doSendMagicEffect(toPosition, CONST_ME_STUN)
	elseif(item.itemid == 7174) then
		if(getPlayerStorageValue(cid, 120) == 4) then
			doCreatureSay(cid, "You hug the unconcious bear.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 120, 5)
			addEvent(doTransformItem, 10 * 1000, item.uid, 7175)
			doSendMagicEffect(toPosition, CONST_ME_SLEEP)
		else
			doCreatureSay(cid, "You don't feel like hugging an unconcious bear.", TALKTYPE_ORANGE_1)
		end
	elseif(item.itemid == 7175) then
		doCreatureSay(cid, "Grr.", TALKTYPE_ORANGE_1)
		doCreatureSay(cid, "The bear is not amused by the disturbance.", TALKTYPE_ORANGE_1)
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getPlayerPosition(cid), 0, -10, -30, CONST_ME_POFF)
	elseif(item.itemid == 7176) then
		if(getPlayerStorageValue(cid, 120) == 5) then
			if(getCreatureCondition(cid, CONDITION_DRUNK)) then
				doCreatureSay(cid, "You hustle the mammoth. What a fun. *hicks*.", TALKTYPE_ORANGE_1)
				setPlayerStorageValue(cid, 120, 6)
				doTransformItem(item.uid, 7177)
				addEvent(doTransformItem, 10 * 1000, item.uid, 7176)
				addEvent(doSendMagicEffect, 10 * 1000, toPosition, CONST_ME_SLEEP)
				doSendMagicEffect(toPosition, CONST_ME_SLEEP)
			else
				doCreatureSay(cid, "You are not drunk enought to hustle a mammoth.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end