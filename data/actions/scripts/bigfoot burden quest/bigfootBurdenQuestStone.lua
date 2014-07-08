function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18336) then
		chance = math.random(15)
		if(getPlayerStorageValue(cid, 952) < 1 and getPlayerStorageValue(cid, 951) == 1) then
			if(chance == 15) then
				setPlayerStorageValue(cid, 952, getPlayerStorageValue(cid, 952) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your skill allowed you to grab a whetstone before the stone sinks into lava.")
				doPlayerAddItem(cid, 18337, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You had no luck this time.")
			end
			doSendMagicEffect(toPosition, CONST_ME_HITBYFIRE)
			doTransformItem(item.uid, 18335)
		end
	end
	return true
end