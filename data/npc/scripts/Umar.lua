local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	-- GREET
	if msg == "DJANNI'HAH" and (player:getStorageValue(GreenDjinn.MissionStart) < 1 or not BlueOrGreen) and not npcHandler:isFocused(cid) then
		if player:getStorageValue(Factions) > 0 then
			npcHandler:addFocus(cid)
			if player:getStorageValue(GreenDjinn.MissionStart) < 1 or not BlueOrGreen then
				npcHandler:say({
					"Whoa? You know the word! Amazing, " .. player:getName() .. "!...",
					"I should go and tell Fa'hradin. ...",
					"Well. Why are you here anyway, " .. player:getName() .. "?"
				}, cid)
				npcHandler:addFocus(cid)
			end
		end
		return true
	end
	-- GREET
	if not npcHandler:isFocused(cid) then
		return false
	end
	-- JOINING
	if msgcontains(msg, "passage") then
		if player:getStorageValue(BlueDjinn.MissionStart) < 1 then
			npcHandler:say({
				"If you want to enter our fortress you have to become one of us and fight the Efreet. ...",
				"So, are you willing to do so?"
			}, cid)
			npcHandler.topic[cid] = 1
		end
	-- JOINING
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
			player:setStorageValue(BlueDjinn.MissionStart, 1)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "<salutes>Aaaa -tention!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "<salutes>Aaaa -tention!")
npcHandler:addModule(FocusModule:new())
