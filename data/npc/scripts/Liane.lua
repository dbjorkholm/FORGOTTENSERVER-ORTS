local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local random_texts = {
	'Welcome to the post office!',
	'Hey, send a letter to your friend now and then. Keep in touch, you know.',
	'If you need help with letters or parcels, just ask me. I can explain everything.',
	'No, no, no, there IS no parcel bug, I\'m telling you!'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 10)
		if(math.random(100) < 20) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)

	if(msgcontains(msg, "measurements")) then
		if player:getStorageValue(250) == 28 then
			npcHandler:say("I have more urgent problem to attend then that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I'll see if I have the time for this nonsense. Do you have 12 arrows with you? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if player:getItemCount(2544) >= 12 then
			player:removeItem(2544, 12)
			npcHandler:say("Great! Now I'll teach them a lesson ... For those measurements ... <tells you her measurements> ", cid)
			player:setStorageValue(250, 29)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello. How may I help you |PLAYERNAME|? Ask me for a trade if you want to buy something. I can also explain the {mail} system.")
npcHandler:setMessage(MESSAGE_FAREWELL, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here. Don't forget that you need to buy a label too if you want to send a parcel. Always write the name of the {receiver} in the first line.")
npcHandler:addModule(FocusModule:new())
