local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "trouble") and npcHandler.topic[cid] ~= 3 and player:getStorageValue(Storage.TheInquisition.MilesGuard) < 1 and player:getStorageValue(Storage.TheInquisition.Mission01) ~= -1 then
		npcHandler:say("I'm fine. There's no trouble at all.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "foresight of the authorities") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Well, of course. We live in safety and peace.", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "also for the gods") and npcHandler.topic[cid] == 2 then
		npcHandler:say("I think the gods are looking after us and their hands shield us from evil.", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "trouble will arise in the near future") and npcHandler.topic[cid] == 3 then
		npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", cid)
		npcHandler.topic[cid] = 0
		local player = Player(cid)
		if player:getStorageValue(Storage.TheInquisition.MilesGuard) < 1 then
			player:setStorageValue(Storage.TheInquisition.MilesGuard, 1)
			player:setStorageValue(Storage.TheInquisition.Mission01, player:getStorageValue(Storage.TheInquisition.Mission01) + 1) -- The Inquisition Questlog- "Mission 1: Interrogation"
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
