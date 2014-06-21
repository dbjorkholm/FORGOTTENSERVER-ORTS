local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	guards = {
		"minotaur guard",
		"minotaur archer",
		"minotaur mage"
	}
	if(getPlayerStorageValue(cid, 258) < 1) then
		npcHandler:setMessage(MESSAGE_GREET, "Intruder! Guards, take him down!")
		setPlayerStorageValue(cid, 258, 1)
		npcHandler:releaseFocus(cid)
		for x = -1, 1 do
			for y = -1, 1 do
				doSummonCreature(guards[math.random(1, 3)], {x = 32418 + x, y = 32147 + y, z = 15})
				doSendMagicEffect({x = 32418 + x, y = 32147 + y, z = 15}, CONST_ME_TELEPORT)
			end
		end
	elseif(getPlayerStorageValue(cid, 258) == 1) then	
		npcHandler:setMessage(MESSAGE_GREET, "Well ... you defeated my guards! Now everything is over! I guess I will have to answer your questions now. ")
		setPlayerStorageValue(cid, 258, 2)
	elseif(getPlayerStorageValue(cid, 258) == 2) then	
		npcHandler:setMessage(MESSAGE_GREET, "Oh its you again. What du you want, hornless messenger?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "letter")) then
		if(getPlayerStorageValue(cid, 250) == 42) then
			npcHandler:say("A letter from my Moohmy?? Do you have a letter from my Moohmy to me? ", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Uhm, well thank you, hornless being. ", cid)
			setPlayerStorageValue(cid, 250, 43)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "bye")) then
		npcHandler:say("Hm ... good bye. ", cid)
		condition = createConditionObject(CONDITION_FIRE)
		setConditionParam(condition, CONDITION_PARAM_TICKS, 30 * 1000)
		setConditionParam(condition, CONDITION_PARAM_MINVALUE, 30)
		setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 4000)
		doAddCondition(cid, condition)
		npcHandler:releaseFocus(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())