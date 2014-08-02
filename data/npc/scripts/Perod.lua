local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 5)
		if(math.random(100) < 25) then
			Npc():say("Stop by before embarking on your great adventure! Distance weapons and general equipment on sale today!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "football")) then
		npcHandler:say("Do you want to buy a football for 111 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getMoney() >= 111 then
				npcHandler:say("Here it is.", cid)
				player:addItem(2109, 1)
				player:removeMoney(111)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough money.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
