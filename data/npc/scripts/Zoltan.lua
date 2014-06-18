local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "proof") then
		if not player:hasOutfit(138, 2) then
				npcHandler:say("... I cannot believe my eyes. You retrieved this hat from Ferumbras' remains? That is incredible. If you give it to me, I will grant you the right to wear this hat as addon. What do you say?", cid)
				npcHandler.topic[cid] = 1
		else
			npcHandler:say("You already have second mage addon.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(5903, 1) then
				local player = Player(cid)
				player:addOutfitAddon(138, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				npcHandler:say("I bow to you, player, and hereby grant you the right to wear Ferumbras´ hat as accessory. Congratulations!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry you don't have the ferumbras hat.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())			

