local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Now, where was I...", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function greetCallback(cid, message)
	local player = Player(cid)
	if player:getStorageValue(Factions) <= 0 or player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) < 1 and not BlueOrGreen then
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
		if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) == 1 then
			npcHandler:say({
				"My collection of recipes is almost complete. There are only but a few that are missing. ...",
				"Mmmm... now that we talk about it. There is something you could help me with. Are you interested?"
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "cookbook") then
		if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) == 3 then
			npcHandler:say("Do you have the cookbook of the dwarven kitchen with you? Can I have it?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Fine! Even though I know so many recipes, I'm looking for the description of some dwarven meals. ...",
				"So, if you could bring me a cookbook of the dwarven kitchen I will reward you well."
			}, cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 2)
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(2347, 1) then
				npcHandler:say({
					"The book! You have it! Let me see! <browses the book> ...",
					"Dragon Egg Omelette, Dwarven beer sauce... it's all there. This is great! Here is your well-deserved reward. ...",
					"Incidentally, I have talked to Fa'hradin about you during dinner. I think he might have some work for you. Why don't you talk to him about it?"
				}, cid)
				player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 4)
				player:addItem(2146, 3)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hey! A human! What are you doing in my kitchen, |PLAYERNAME|?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye. I am sure you will come back for more. They all do.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye. I am sure you will come back for more. They all do.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
