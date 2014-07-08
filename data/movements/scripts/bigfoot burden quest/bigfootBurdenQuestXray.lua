local gnomedixMessages = {
	"Gnomedix: Now! Now! Don't panic! It's all over soon!",
	"Gnomedix: Let me try a bigger chisel!",
	"Gnomedix: We're almost don... holy gnome! What's THIS???",
	"Gnomedix: I need a drill! Gnomenursey, quick!",
	"Gnomedix: Hold still now! This might tickle a little..",
	"Gnomedix: Take this, you evil ... whatever you are!",
	"Gnomedix: I got it! Yikes! What was that? Uhm, well ... you passed the ear examination. Talk to Gnomaticus for your next test."	
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.uid == 3122 then
		if player:getStorageValue(900) == 4 then
			player:setOutfit("skeleton", 2 * 1000)
			player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
			player:setStorageValue(900, 5)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've been succesfully g-rayed. Now let Doctor Gnomedix inspect your ears!")
			player:say("*Rrrrrrrrrrr...*", TALKTYPE_ORANGE_1)
		elseif player:getStorageValue(900) < 4 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The x-ray is not ready.")
			player:teleportTo(fromPosition, true)
		end
	elseif item.uid == 3123 then
		if player:getStorageValue(900) == 6 then
			-- Commenting away stopMove since this function has been removed
			-- player:stopMove(true)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Gnomedix: So let the examination begin! Now don't move. Don't be afraid. The good doctor gnome won't hurt you - hopefully!")
			for i = 1, 7 do
				addEvent(function(cid, position) local player = Player(cid) if player then player:sendTextMessage(MESSAGE_EVENT_ADVANCE, gnomedixMessages[i]) player:getPosition():sendMagicEffect(CONST_ME_STUN) end end, i * 2000, cid, position)
			end
			player:getPosition():sendMagicEffect(CONST_ME_STUN)
			player:setStorageValue(900, 7)
			addEvent(function(cid) local player = Player(cid) if player then player:stopMove(false) Game.createMonster("strange slime", Position({x = player:getPosition().x, y = player:getPosition().y + 1, z = player:getPosition().z}), false, true) end end, 14000, cid)
		end
	end
	return true
end
