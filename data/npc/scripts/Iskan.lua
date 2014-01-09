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

	if(getPlayerStorageValue(cid, 120) ~= 7) then -- Check if true barbarian
		return true
	end
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 121) < 1) then
			npcHandler:say("Well, one of the boys has run away. I think he got the scent of some beast. He's young and inexperienced so I can't blame the cub ...", cid)
			npcHandler:say("I would like you to see after him. He should be somewhere north west of the town. He is probably marking his territory so you should be able to find his trace. Are you willing to do that?", cid)
			npcHandler:say("", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 121) == 2) then
			npcHandler:say("You are a friend of mine and the boys now. I tell you something. If you ever need to go to the isle of Nibelor, just ask me for a passage.", cid)
			setPlayerStorageValue(cid, 121, 3)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 121) == 3) then
			npcHandler:say("We could indeed need some help. These are very cold times. The ice is growing and becoming thicker everywhere ...", cid)
			npcHandler:say("The problem is that the chakoyas may use the ice for a passage to the west and attack Svargrond ...", cid)
			npcHandler:say("We need you to get a pick and to destroy the ice at certain places to the east. You will quickly recognise those spots by their unstable look ...", cid)
			npcHandler:say("Use the pickaxe on at least three of these places and the chakoyas probably won't be able to pass the ice. Once you are done, return here and report about your mission. ", cid)
			setPlayerStorageValue(cid, 121, 4)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("That's surprising. Take a piece of meat. If you find the boy, feed it to him. That will give him enough strength and incentive to return to his pack ...", cid)
			npcHandler:say("Talk to him by calling his name 'Sniffler' and tell him you got meat for him. After he has eaten the meat, return here to talk to me about your mission.", cid)
			setPlayerStorageValue(cid, 121, 1)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())