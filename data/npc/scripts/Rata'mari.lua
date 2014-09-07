local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	if Player(cid):getStorageValue(BlueDjinn.MissionStart + 2) ~= 1 then
		return false
	end

	npcHandler.topic[cid] = 1
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "spy report") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"You have come for the report? Great! I have been working hard on it during the last months. And nobody came to pick it up. I thought everybody had forgotten about me! ...",
				"Do you have any idea how difficult it is to hold a pen when you have claws instead of hands? ...",
				"But - you know - now I have worked so hard on this report I somehow don't want to part with it. Atleast not without some decent payment. ...",
				"All right - listen - I know Fa'hradin would not approve of this, but I can't help it. I need some cheese! I need it now! ...",
				"And I will not give the report to you until you get me some! Meep!"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Ok, have you brought me the cheese, I've asked for?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 3 then
			local player = Player(cid)
			if player:removeItem(2696, 1) then
				npcHandler:say({
					"Meep! Meep! Great! Here is the spyreport for you!",
					"Meep!"
				}, cid)
				player:setStorageValue(BlueDjinn.MissionStart+2, 2)
				player:addItem(2345, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Come back when you have brought the cheese.", cid)
				npcHandler.topic[cid] = 2
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Meep? I mean - hello! Sorry, |PLAYERNAME|... Being a rat has kind of grown on me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Meep!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Meep!")

local focusModule = FocusModule:new()
focusModule:addGreetMessage('piedpiper')
npcHandler:addModule(focusModule)
