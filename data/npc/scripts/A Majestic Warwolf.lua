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
	local player = Player(cid)
	if player:getStorageValue(1004) < 9 then
		npcHandler:say("GRRRRRRRRRRRRR", player)
		return false
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	local player = Player(cid)
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(1004) == 9 then
			npcHandler:say("I can see in your eyes that you are a honest and friendly person, |PLAYERNAME|. You were patient enough to learn our language and I will grant you a special gift. Will you accept it?", player)
			talkState[talkUser] = 2
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 2 then	
			npcHandler:say("From now on, you shall be known as |PLAYERNAME|, the bear warrior. You shall be strong and proud as Angros, the great dark bear. He shall guide your path.", player)
			player:setStorageValue(1004, 10)
			player:addOutfitAddon(148, 2)
			player:addOutfitAddon(144, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			talkState[talkUser] = 0
		end
	end
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
