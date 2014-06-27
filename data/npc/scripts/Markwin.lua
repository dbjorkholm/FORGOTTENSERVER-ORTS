local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	guards = {
		"Minotaur Guard",
		"Minotaur Archer",
		"Minotaur Mage"
	}
	local player = Player(cid)
	if player:getStorageValue(258) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Intruder! Guards, take him down!")
		player:setStorageValue(258, 1)
		npcHandler:releaseFocus(cid)
		for x = -1, 1 do
			for y = -1, 1 do
				doSummonCreature(guards[math.random(1, 3)], {x = 32418 + x, y = 32147 + y, z = 15})
				doSendMagicEffect({x = 32418 + x, y = 32147 + y, z = 15}, CONST_ME_TELEPORT)
			end
		end
	elseif player:getStorageValue(258) == 1 then	
		npcHandler:setMessage(MESSAGE_GREET, "Well ... you defeated my guards! Now everything is over! I guess I will have to answer your questions now. ")
		player:setStorageValue(258, 2)
	elseif player:getStorageValue(258) == 2 then	
		npcHandler:setMessage(MESSAGE_GREET, "Oh its you again. What du you want, hornless messenger?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "letter")) then
		if player:getStorageValue(250) == 42 then
			npcHandler:say("A letter from my Moohmy?? Do you have a letter from my Moohmy to me? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Uhm, well thank you, hornless being. ", cid)
			player:setStorageValue(250, 43)
			npcHandler.topic[cid] = 0
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
