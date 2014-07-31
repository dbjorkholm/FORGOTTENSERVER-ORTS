local messages = {
	"Gnomedix: Now! Now! Don't panic! It's all over soon!",
	"Gnomedix: Let me try a bigger chisel!",
	"Gnomedix: We're almost don... holy gnome! What's THIS???",
	"Gnomedix: I need a drill! Gnomenursey, quick!",
	"Gnomedix: Hold still now! This might tickle a little..",
	"Gnomedix: Take this, you evil ... whatever you are!",
	"Gnomedix: I got it! Yikes! What was that? Uhm, well ... you passed the ear examination. Talk to Gnomaticus for your next test."	
}

local function sendTextMessages(cid, text, position)
	local player = Player(cid)
	if not player then
		return true
	end
	
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, text)
	position:sendMagicEffect(CONST_ME_STUN)
end

local function summonMonster(name, position)
	Game.createMonster(name, position)
end

local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(2000)
condition:addOutfit({lookType = 33}) -- skeleton looktype

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.uid == 3122 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 4 then
			player:addCondition(condition)
			player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 5)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've been succesfully g-rayed. Now let Doctor Gnomedix inspect your ears!")
			player:say("*Rrrrrrrrrrr...*", TALKTYPE_MONSTER_SAY)
		elseif player:getStorageValue(Storage.BigfootBurden.QuestLine) < 4 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The x-ray is not ready.")
			player:teleportTo(fromPosition, true)
		end
	elseif item.uid == 3123 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 6 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Gnomedix: So let the examination begin! Now don't move. Don't be afraid. The good doctor gnome won't hurt you - hopefully!")
			local playerPosition = player:getPosition()
			for i = 1, 7 do
				addEvent(sendTextMessages, i * 2000, cid, messages[i], playerPosition)
			end
			playerPosition:sendMagicEffect(CONST_ME_STUN)
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 7)
			position.y = position.y + 1
			addEvent(summonMonster, 14 * 1000, 'Strange Slime', position)
		end
	end
	return true
end
