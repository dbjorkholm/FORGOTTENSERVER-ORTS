function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3122) then
		if(getPlayerStorageValue(cid, 900) == 4) then
			doSetMonsterOutfit(cid, "skeleton", 2 * 1000)
			doSendMagicEffect(position, CONST_ME_ENERGYHIT)
			setPlayerStorageValue(cid, 900, 5)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You've been succesfully g-rayed. Now let Doctor Gnomedix inspect your ears!")
			doCreatureSay(cid, "*Rrrrrrrrrrr...*", TALKTYPE_ORANGE_1)
		elseif(getPlayerStorageValue(cid, 900) < 4) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The x-ray is not ready.")
			doTeleportThing(cid, lastPosition)
		end
	elseif(item.uid == 3123) then
		if(getPlayerStorageValue(cid, 900) == 6) then
			Player(cid):stopMove(true)
			addEvent(function() local player = Player(cid) if player ~= nil then player:stopMove(false) end end, 14 * 1000)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: So let the examination begin! Now don't move. Don't be afraid. The good doctor gnome won't hurt you - hopefully!")
			addEvent(doPlayerSendTextMessage, 2 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: Now! Now! Don't panic! It's all over soon!")
			addEvent(doPlayerSendTextMessage, 4 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: Let me try a bigger chisel!")
			addEvent(doPlayerSendTextMessage, 6 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: We're almost don... holy gnome! What's THIS???")
			addEvent(doPlayerSendTextMessage, 8 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: I need a drill! Gnomenursey, quick!")
			addEvent(doPlayerSendTextMessage, 10 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: Hold still now! This might tickle a little..")
			addEvent(doPlayerSendTextMessage, 12 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: Take this, you evil ... whatever you are!")
			addEvent(doPlayerSendTextMessage, 14 * 1000, cid, MESSAGE_EVENT_ADVANCE, "Gnomedix: I got it! Yikes! What was that? Uhm, well ... you passed the ear examination. Talk to Gnomaticus for your next test.")
			for i = 1, 7 do
				addEvent(doSendMagicEffect, i * 2000, position, CONST_ME_STUN)
			end
			doSendMagicEffect(position, CONST_ME_STUN)
			setPlayerStorageValue(cid, 900, 7)
			addEvent(doSummonCreature, 14 * 1000, "strange slime", {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z})
		end
	end
	return true
end
