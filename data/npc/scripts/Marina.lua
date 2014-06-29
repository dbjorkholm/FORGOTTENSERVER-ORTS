local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "silk yarn")) then
		if player:getStorageValue(78) < 1 then
			npcHandler:say("Um. You mean, you really want me to touch that gooey spider silk just because you need yarn? Well... do you think that I'm pretty?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(78) == 1 then
			npcHandler:say("Okay... a deal is a deal, would you like me to create a {spool of yarn} from {10 pieces of spider silk}?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif(msgcontains(msg, "50 honeycombs")) then
		if(npcHandler.topic[cid] == 3) then
			npcHandler:say("Did you bring me the 50 honeycombs I requested and do you absolutely admire my beauty?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Well, everyone would say that in your position. Do you think that I'm really, absolutely the most stunning being that you have ever seen?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("<giggles> It's funny how easy it is to get humans to say what you want. Now, proving it will be even more fun! ...", cid)
			npcHandler:say("You want me to touch something gooey, so you have to touch something gooey for me too. <giggles> ...", cid)
			npcHandler:say("I love honey and I haven't eaten it in a while, so bring me 50 honeycombs and worship my beauty a little more, then we will see.", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 4) then
			if player:getItemCount(5902) >= 50 then
				player:removeItem(5902, 50)
				npcHandler:say("Oh goodie! Thank you! Okay... I guess since my fingers are sticky now anyway, I will help you. From now on, if you bring me {10 pieces of spider silk}, I will create one {spool of yarn}.", cid)
				npcHandler.topic[cid] = 0
				player:setStorageValue(78, 1)
			end
		elseif(npcHandler.topic[cid] == 5) then
			if player:getItemCount(5879) >= 10 then
				player:removeItem(5879, 10)
				player:addItem(5886, 1)
				npcHandler:say("Ew... gooey... there you go.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
