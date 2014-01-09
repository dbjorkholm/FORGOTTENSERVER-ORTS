local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	npcHandler:onThink()					
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 90) > 34) then
			npcHandler:say("The most important mission we currently have is an expedition to Calassa.", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "calassa")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Ah! So you have heard about our special mission to investigate the Quara race in their natural surrounding! Would you like to know more about it?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 4) then
			npcHandler:say("Captain Max will bring you to Calassa whenever you are ready. Please try to retrieve the missing logbook which must be in one of the sunken shipwrecks.", cid)
			setPlayerStorageValue(cid, 90, 63)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 90) == 64) then
			npcHandler:say("OH! So you have safely returned from Calassa! Congratulations, were you able to retrieve the logbook?", cid)
			talkState[talkUser] = 5
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say("Since you have already proved to be a valuable member of our society, I will happily entrust you with this mission, but there are a few things which you need to know, so listen carefully. ...", cid)
			npcHandler:say("Calassa is an underwater settlement, so you are in severe danger of drowning unless you are well-prepared. ...", cid)
			npcHandler:say("We have developed a new device called 'Helmet of the Deep' which will enable you to breathe even in the depths of the ocean. ...", cid)
			npcHandler:say("I will instruct Captain Max to bring you to Calassa and to lend one of these helmets to you. These helmets are very valuable, so there is a deposit of 5000 gold pieces on it. ...", cid)
			npcHandler:say("While in Calassa, do not take the helmet off under any circumstances. If you have any questions, don't hesitate to ask Captain Max. ...", cid)
			npcHandler:say("Your mission there, apart from observing the Quara, is to retrieve a special logbook from one of the shipwrecks buried there. ...", cid)
			npcHandler:say("One of our last expeditions there failed horribly and the ship sank, but we still do not know the exact reason. ...", cid)
			npcHandler:say("If you could retrieve the logbook, we'd finally know what happened. Have you understood your task and are willing to take this risk?", cid)
			talkState[talkUser] = 3
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("Excellent! I will immediately inform Captain Max to bring you to Calassa whenever you are ready. Don't forget to make thorough preparations!", cid)
			talkState[talkUser] = 4
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 6124) >= 1) then
				doPlayerRemoveItem(cid, 6124, 1)
				npcHandler:say("Yes! That's the logbook! However... it seems that the water has already destroyed many of the pages. This is not your fault though, you did your best. Thank you!", cid)
				setPlayerStorageValue(cid, 90, 65)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())