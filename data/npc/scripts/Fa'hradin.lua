local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(150, 2000, -10)

local function greetCallback(cid, message)
	local player = Player(cid)
	if not msgcontains(message, 'djanni\'hah') then
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addCondition(condition)
		return false
	end

	if player:getStorageValue(Storage.DjinnWar.Factions) <= 0 or player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) < 1 and not BlueOrGreen then
		return false
	end

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) == 4 and player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission02) < 1 then
			npcHandler:say({
				"I have heard some good things about you from Bo'ques. But I don't know. ...",
				"Well, all right. I do have a job for you. ...",
				"In order to stay informed about our enemy's doings, we have managed to plant a spy in Mal'ouquah. ...",
				"He has kept the Efreet and Malor under surveillance for quite some time. ...",
				"But unfortunately, I have lost contact with him months ago. ...",
				"I do not fear for his safety because his cover is foolproof, but I cannot contact him either. This is where you come in. ...",
				"I need you to infiltrate Mal'ouqhah, contact our man there and get his latest spyreport. The password is {PIEDPIPER}. Remember it well! ...",
				"I do not have to add that this is a dangerous mission, do I? If you are discovered expect to be attacked! So goodluck, human!"
			}, cid)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 1)
		elseif player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission02) == 2 then
			npcHandler:say("Did you already retrieve the spyreport?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:removeItem(2345, 1) then
			npcHandler:say({
				"You really have made it? You have the report? How come you did not get slaughtered? I must say I'm impressed. Your race will never cease to surprise me. ...",
				"Well, let's see. ...",
				"I think I need to talk to Gabel about this. I am sure he will know what to do. Perhaps you should have aword with him, too."
			}, cid)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 3)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say('Farewell, human. I will always remember you. Unless I forget you, of course.', cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Aaaah... what have we here. A human - interesting. And such an ugly specimen, too... All right, human |PLAYERNAME|. How can I help you?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human. I will always remember you. Unless I forget you, of course.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
