local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_TICKS, 30 * 1000)
condition:setParameter(CONDITION_PARAM_MINVALUE, 30)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(258) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Intruder! Guards, take him down!")
		player:setStorageValue(258, 1)
		local position
		local guards = { "Minotaur Guard", "Minotaur Archer", "Minotaur Mage" }
		for x = -1, 1 do
			for y = -1, 1 do
				position = Position(32418 + x, 32147 + y, 15)
				Game.createMonster(guards[math.random(3)], position)
				position:sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif player:getStorageValue(258) == 1 then	
		npcHandler:setMessage(MESSAGE_GREET, "Well ... you defeated my guards! Now everything is over! I guess I will have to answer your questions now. ")
		player:setStorageValue(258, 2)
	elseif player:getStorageValue(258) == 2 then	
		npcHandler:setMessage(MESSAGE_GREET, "Oh its you again. What du you want, hornless messenger?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, "letter") then
		if Player(cid):getStorageValue(250) == 42 then
			npcHandler:say("A letter from my Moohmy?? Do you have a letter from my Moohmy to me? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Uhm, well thank you, hornless being. ", cid)
			Player(cid):setStorageValue(250, 43)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "bye") then
		npcHandler:say("Hm ... good bye. ", cid)
		Player(cid):addCondition(condition)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
