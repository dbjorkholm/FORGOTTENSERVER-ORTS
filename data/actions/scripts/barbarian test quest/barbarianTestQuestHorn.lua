function onUse(cid, item, fromPosition, itemEx, toPosition)
	local creature = Creature(cid)
	local player = Player(cid)
	if(itemEx.uid == 7140 and item.itemid == 7140) then
		creature:say("You fill your horn with ale.", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, 7141)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
	elseif(itemEx.uid == 7141 and item.itemid == 7175) then
			creature:say("The bear is now unconcious.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 7140)
			doTransformItem(itemEx.uid, 7174)
			doSendMagicEffect(toPosition, CONST_ME_STUN)
	elseif(item.itemid == 7174) then
		if(player:getStorageValue(120) == 4) then
			creature:say("You hug the unconcious bear.", TALKTYPE_ORANGE_1)
			player:setStorageValue(120, 5)
			addEvent(doTransformItem, 10 * 1000, item.uid, 7175)
			doSendMagicEffect(toPosition, CONST_ME_SLEEP)
		else
			creature:say("You don't feel like hugging an unconcious bear.", TALKTYPE_ORANGE_1)
		end
	elseif(item.itemid == 7175) then
		creature:say("Grr.", TALKTYPE_ORANGE_1)
		creature:say("The bear is not amused by the disturbance.", TALKTYPE_ORANGE_1)
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getPlayerPosition(cid), 0, -10, -30, CONST_ME_POFF)
	elseif(item.itemid == 7176) then
		if(player:getStorageValue(120) == 5) then
			if(getCreatureCondition(cid, CONDITION_DRUNK)) then
				creature:say("You hustle the mammoth. What a fun. *hicks*.", TALKTYPE_ORANGE_1)
				player:setStorageValue(120, 6)
				doTransformItem(item.uid, 7177)
				addEvent(doTransformItem, 10 * 1000, item.uid, 7176)
				addEvent(doSendMagicEffect, 10 * 1000, toPosition, CONST_ME_SLEEP)
				doSendMagicEffect(toPosition, CONST_ME_SLEEP)
			else
				creature:say("You are not drunk enought to hustle a mammoth.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end