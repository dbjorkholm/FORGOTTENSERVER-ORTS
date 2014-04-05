function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(itemEx.uid == 3110 and item.itemid == 7140) then
		player:say("You fill your horn with ale.", TALKTYPE_ORANGE_1)
		Item(item.uid):transform(7141)
		Position(toPosition):sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif(itemEx.itemid == 7174 and item.itemid == 7141) then
			player:say("The bear is now unconcious.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7140)
			Item(itemEx.uid):transform(7175)
			Position(toPosition):sendMagicEffect(CONST_ME_STUN)
	elseif(item.itemid == 7175) then
		if(player:getStorageValue(120) == 4) then
			player:say("You hug the unconcious bear.", TALKTYPE_ORANGE_1)
			player:setStorageValue(120, 5)
			player:setStorageValue( 12023, 2) -- Questlog Barbarian Test Quest Barbarian Test 2: The Bear Hugging
			addEvent(doTransformItem, 60*1000, itemEx.uid, 7174)
			Position(toPosition):sendMagicEffect(CONST_ME_SLEEP)
		else
			player:say("You don't feel like hugging an unconcious bear.", TALKTYPE_ORANGE_1)
		end
	elseif(item.itemid == 7174) then
		player:say("Grr.", TALKTYPE_ORANGE_1)
		player:say("The bear is not amused by the disturbance.", TALKTYPE_ORANGE_1)
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, player:getPosition(), 0, -10, -30, CONST_ME_POFF)
	elseif(item.itemid == 7176) then
		if(player:getStorageValue(120) == 6) then
			if(player:getCondition(CONDITION_DRUNK)) then
				player:say("You hustle the mammoth. What a fun. *hicks*.", TALKTYPE_ORANGE_1)
				player:setStorageValue(120, 7)
				player:setStorageValue( 12024, 2) -- Questlog Barbarian Test Quest Barbarian Test 3: The Mammoth Pushing
				Item(itemEx.uid):transform(7177)
				addEvent(doTransformItem, 60*1000, itemEx.uid, 7176)
				addEvent(doSendMagicEffect, 60*1000, toPosition, CONST_ME_SLEEP)
				Position(toPosition):sendMagicEffect(CONST_ME_SLEEP)
			else
				player:say("You are not drunk enought to hustle a mammoth.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end