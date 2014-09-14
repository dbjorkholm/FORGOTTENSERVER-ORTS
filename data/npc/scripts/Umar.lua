local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Factions) <= 0 or player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) < 1 and BlueOrGreen then
		return false
	end

	npcHandler:say({
		"Whoa? You know the word! Amazing, |PLAYERNAME|! ...",
		"I should go and tell Fa'hradin. ...",
		"Well. Why are you here anyway, |PLAYERNAME|?"
	}, cid)
	npcHandler:addFocus(cid)
	return false
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "passage") then
		if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) < 1 then
			npcHandler:say({
				"If you want to enter our fortress you have to become one of us and fight the Efreet. ...",
				"So, are you willing to do so?"
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Are you sure? You pledge loyalty to king Gabel, who is... you know. And you are willing to never ever set foot on Efreets' territory, unless you want to kill them? Yes?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say({
				"Oh. Ok. Welcome then. You may pass. ...",
				"And don't forget to kill some Efreets, now and then."
			}, cid)
			npcHandler.topic[cid] = 3
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 1)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "<salutes>Aaaa -tention!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "<salutes>Aaaa -tention!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)

