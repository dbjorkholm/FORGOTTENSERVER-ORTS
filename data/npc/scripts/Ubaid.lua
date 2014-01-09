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
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- GREET
	if(msg == "DJANNI'HAH" and getPlayerStorageValue(cid, 82) < 1) and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, 80) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, 82) < 1) then
				npcHandler:say("What? You know the word, Player? All right then - I won't kill you. At least, not now.", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- JOINING
	if(msgcontains(msg, "passage")) then
		if(getPlayerStorageValue(cid, 81) < 1) then
			npcHandler:say({"Only the mighty Efreet, the true djinn of Tibia, may enter Mal'ouquah! ...","All Marids and little worms like yourself should leave now or something bad may happen. Am I right?"}, cid, 0, 1, 3000)
			talkState[talkUser] = 1
		end
	-- JOINING
	
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say("So you pledge loyalty to king Malor and you are willing to never ever set foot on Marids' territory, unless you want to kill them? Yes?", cid)
			talkState[talkUser] = 3
		elseif(talkState[talkUser] == 3) then
			npcHandler:say({"Well then - welcome to Mal'ouquah. ...", "Go now to general Baa'leal and don't forget to greet him correctly! ...", "And don't touch anything!"}, cid, 0, 1, 2500)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 81, 1)
			setPlayerStorageValue(cid, 9023, 1)
		end
	elseif(msgcontains(msg, "no")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"Of cour... Huh!? No!? I can't believe it! ...", "You... you got some nerves... Hmm. ...", "Maybe we have some use for someone like you. Would you be interested in working for us. Helping to fight the Marid?"}, cid, 0, 1, 3000)
			talkState[talkUser] = 2
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Farewell human!", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)