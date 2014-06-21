local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "silk yarn")) then
		if(getPlayerStorageValue(cid, 78) < 1) then
			npcHandler:say("Um. You mean, you really want me to touch that gooey spider silk just because you need yarn? Well... do you think that I'm pretty?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 78) == 1) then
			npcHandler:say("Okay... a deal is a deal, would you like me to create a {spool of yarn} from {10 pieces of spider silk}?", cid)
			talkState[talkUser] = 5
		end
	elseif(msgcontains(msg, "50 honeycombs")) then
		if(talkState[talkUser] == 3) then
			npcHandler:say("Did you bring me the 50 honeycombs I requested and do you absolutely admire my beauty?", cid)
			talkState[talkUser] = 4
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Well, everyone would say that in your position. Do you think that I'm really, absolutely the most stunning being that you have ever seen?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("<giggles> It's funny how easy it is to get humans to say what you want. Now, proving it will be even more fun! ...", cid)
			npcHandler:say("You want me to touch something gooey, so you have to touch something gooey for me too. <giggles> ...", cid)
			npcHandler:say("I love honey and I haven't eaten it in a while, so bring me 50 honeycombs and worship my beauty a little more, then we will see.", cid)
			talkState[talkUser] = 3
			setPlayerStorageValue(cid, 79, 1)
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 5902) >= 50) then
				doPlayerRemoveItem(cid, 5902, 50)
				npcHandler:say("Oh goodie! Thank you! Okay... I guess since my fingers are sticky now anyway, I will help you. From now on, if you bring me {10 pieces of spider silk}, I will create one {spool of yarn}.", cid)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, 78, 1)
			end
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 5979) >= 10) then
				doPlayerRemoveItem(cid, 5979, 10)
				doPlayerAddItem(cid, 5886, 1)
				npcHandler:say("Ew... gooey... there you go.", cid)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())