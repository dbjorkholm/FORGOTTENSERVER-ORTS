local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.UnnaturalSelection.Questline) == 5 then
			npcHandler:say(	
			{
				"The great hunt! About to begin, but gods are not in favour of us yet. We need all help we get. We please Krunus with special nature dance. ...",
				"You seen Krunus altar south in camp, on mountain top? This is where dance is. If you do right steps Krunus will give you sign. If wrong, he not pleased. ...",
				"Do Krunus dance for us! Step and dance and turn around! You will know when you do good. Make {Krunus} happy and support our great hunt!"
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.UnnaturalSelection.Questline) == 6 then
			npcHandler:say("Come back if you finished the dance.", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.UnnaturalSelection.Questline) == 7 then
			npcHandler:say("work in process", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "krunus") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Krunus is God for plants and birth. He hidden in all that grows.", cid)
			player:setStorageValue(Storage.UnnaturalSelection.Questline, 6)
			player:setStorageValue(Storage.UnnaturalSelection.Mission03, 2) --Questlog, Unnatural Selection Quest "Mission 3: Dance Dance Evolution"
			player:setStorageValue(Storage.UnnaturalSelection.DanceStatus, 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
