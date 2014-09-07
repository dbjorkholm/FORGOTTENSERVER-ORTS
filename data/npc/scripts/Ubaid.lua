local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid, message)
	if player:getStorageValue(Factions) <= 0 or player:getStorageValue(BlueDjinn.MissionStart) > 0 then
		return false
	end

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "passage") then
		if player:getStorageValue(GreenDjinn.MissionStart) < 1 then
			npcHandler:say({
				"Only the mighty Efreet, the true djinn of Tibia, may enter Mal'ouquah! ...",
				"All Marids and little worms like yourself should leave now or something bad may happen. Am I right?"
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("So you pledge loyalty to king Malor and you are willing to never ever set foot on Marids' territory, unless you want to kill them? Yes?", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say({
				"Well then - welcome to Mal'ouquah. ...",
				"Go now to general Baa'leal and don't forget to greet him correctly! ...",
				"And don't touch anything!"
			}, cid)
			player:setStorageValue(GreenDjinn.MissionStart, 1)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Of cour... Huh!? No!? I can't believe it! ...",
				"You... you got some nerves... Hmm. ...",
				"Maybe we have some use for someone like you. Would you be interested in working for us. Helping to fight the Marid?"
			}, cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "What? You know the word, |PLAYERNAME|? All right then - I won't kill you. At least, not now.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell human!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell human!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
