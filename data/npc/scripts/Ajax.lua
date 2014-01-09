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

function greetCallback(cid)
	if(getPlayerStorageValue(cid, 1000) == 1 or getPlayerStorageValue(cid, 1000) > 3) then	
		npcHandler:setMessage(MESSAGE_GREET, "Whatcha do in my place?")
	elseif(getPlayerStorageValue(cid, 1000) == 2 and getPlayerStorageValue(cid, 1001) < os.time()) then	
		npcHandler:setMessage(MESSAGE_GREET, "You back. You know, you right. Brother is right. Fist not always good. Tell him that!")
		setPlayerStorageValue(cid, 1000, 3)
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	-- PREQUEST
	if(msgcontains(msg, "mine")) then
		if(getPlayerStorageValue(cid, 1000) == 1) then
			npcHandler:say("YOURS? WHAT IS YOURS! NOTHING IS YOURS! IS MINE! GO AWAY, YES?!", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "no")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("YOU STUPID! STUBBORN! I KILL YOU! WILL LEAVE NOW?!", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("ARRRRRRRRRR! YOU ME DRIVE MAD! HOW I MAKE YOU GO??", cid)
			talkState[talkUser] = 3
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("I GIVE YOU NO!", cid)		
			talkState[talkUser] = 4
		end
	elseif(msgcontains(msg, "please")) then
		if(talkState[talkUser] == 4) then
			npcHandler:say("Please? What you mean please? Like I say please you say bye? Please?", cid)
			talkState[talkUser] = 5
		end
	-- OUTFIT
	elseif(msgcontains(msg, "gelagos")) then
		if(getPlayerStorageValue(cid, 1000) == 4) then
			npcHandler:say("Annoying kid. Bro hates him, but talking no help. Bro needs fighting spirit!", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "fighting spirit")) then
		if(talkState[talkUser] == 6) then
			npcHandler:say("If you want to help bro, bring him fighting spirit. Magic fighting spirit. Ask Djinn.", cid)
			setPlayerStorageValue(cid, 1000, 5)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "present")) then
		if(getPlayerStorageValue(cid, 1000) == 11) then
			npcHandler:say("Bron gave me present. Ugly, but nice from him. Me want to give present too. You help me?", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "ore")) then
		if(getPlayerStorageValue(cid, 1000) == 12) then
			npcHandler:say("You bring 100 iron ore?", cid)
			talkState[talkUser] = 8
		end
	elseif(msgcontains(msg, "iron")) then
		if(getPlayerStorageValue(cid, 1000) == 13) then
			npcHandler:say("You bring crude iron?", cid)
			talkState[talkUser] = 9
		end
	elseif(msgcontains(msg, "fangs")) then
		if(getPlayerStorageValue(cid, 1000) == 14) then
			npcHandler:say("You bring 50 behemoth fangs?", cid)
			talkState[talkUser] = 10
		end
	elseif(msgcontains(msg, "leather")) then
		if(getPlayerStorageValue(cid, 1000) == 15) then
			npcHandler:say("You bring 50 lizard leather?", cid)
			talkState[talkUser] = 11
		end
	elseif(msgcontains(msg, "axe")) then
		if(getPlayerStorageValue(cid, 1000) == 16 and getPlayerStorageValue(cid, 1001) < os.time()) then
			npcHandler:say("Axe is done! For you. Take. Wear like me.", cid)
			setPlayerStorageValue(cid, 1000, 17)
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 147 or 143, 2)
		else
			npcHandler:say("Axe is not done yet!", cid)
		end
	-- OUTFIT	
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 5) then
			npcHandler:say("Oh. Easy. Okay. Please is good. Now don't say anything. Head aches. ", cid)
			condition = createConditionObject(CONDITION_FIRE)
			setConditionParam(condition, CONDITION_PARAM_TICKS, 30 * 1000)
			setConditionParam(condition, CONDITION_PARAM_MINVALUE, 30)
			setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 4000)
			doAddCondition(cid, condition)
			npcHandler:releaseFocus(cid)
			setPlayerStorageValue(cid, 1000, 2)
			setPlayerStorageValue(cid, 1001, os.time() + 60 * 60 * 1000)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then	
			npcHandler:say("Good! Me make shiny weapon. If you help me, I make one for you too. Like axe I wear. I need stuff. Listen. ...", cid)
			npcHandler:say("Me need 100 iron ore. Then need crude iron. Then after that 50 behemoth fangs. And 50 lizard leather. You understand?", cid)
			npcHandler:say("Help me yes or no?", cid)
			talkState[talkUser] = 7
		elseif(talkState[talkUser] == 7) then	
			npcHandler:say("Good. You get 100 iron ore first. Come back.", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 1000, 12)
		elseif(talkState[talkUser] == 8) then
			if(getPlayerItemCount(cid, 5880) >= 100) then
				npcHandler:say("Good! Now bring crude iron.", cid)
				doPlayerRemoveItem(cid, 5880, 100)
				setPlayerStorageValue(cid, 1000, 13)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 9) then
			if(getPlayerItemCount(cid, 5892) >= 1) then
				npcHandler:say("Good! Now bring 50 behemoth fangs.", cid)
				doPlayerRemoveItem(cid, 5892, 1)
				setPlayerStorageValue(cid, 1000, 14)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 10) then
			if(getPlayerItemCount(cid, 5893) >= 50) then
				npcHandler:say("Good! Now bring 50 lizard leather.", cid)
				doPlayerRemoveItem(cid, 5893, 50)
				setPlayerStorageValue(cid, 1000, 15)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 11) then
			if(getPlayerItemCount(cid, 5876) >= 50) then
				npcHandler:say("Ah! All stuff there. I will start making axes now. Come later and ask me for axe.", cid)
				doPlayerRemoveItem(cid, 5876, 50)
				setPlayerStorageValue(cid, 1000, 16)
				setPlayerStorageValue(cid, 1001, os.time() + 2 * 60 * 60 * 1000)
				talkState[talkUser] = 0	
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())