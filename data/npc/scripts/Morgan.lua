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
	elseif(msgcontains(msg, 'addon')) then
		selfSay('I can forge the finest {weapons} for knights and warriors. They may wear them proudly and visible to everyone.', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "firebird") then
		if player:getStorageValue(Storage.OutfitQuest.PirateSabreAddon) == 4 then
			selfSay("Ahh. So Duncan sent you, eh? You must have done something really impressive. Okay, take this fine sabre from me, mate.", cid)
			player:setStorageValue(Storage.OutfitQuest.PirateSabreAddon, 5)
			player:addOutfitAddon(151, 1)
			player:addOutfitAddon(155, 1)
		end
	elseif(msgcontains(msg, 'weapons') and npcHandler.topic[cid] == 1) then
		selfSay('Would you rather be interested in a {knight\'s sword} or in a {warrior\'s sword}?', cid)
		npcHandler.topic[cid] = 2
	elseif (msgcontains(msg, 'warrior\'s sword') or msgcontains(msg, 'warriors sword')) then
		if npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.WarriorSwordAddon) < 1 then 
			selfSay('Great! Simply bring me 100 iron ore and one royal steel and I will happily {forge} it for you.', cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 4  and player:getStorageValue(Storage.OutfitQuest.WarriorSwordAddon) < 1 then
			if player:removeItem(5887,1) and player:removeItem(5880,100) then
				selfSay('Alright! As a matter of fact, I have one in store. Here you go!', cid)             
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.WarriorSwordAddon,1) 
				player:addOutfitAddon(134, 2)
				player:addOutfitAddon(142, 2)   
				npcHandler.topic[cid] = 0
			else
				selfSay('You do not have all the required items.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] > 1 then 
			selfSay('You already have this outfit!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif (msgcontains(msg, 'knights sword') or msgcontains(msg, 'knight\'s sword')) then
		if npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.KnightSwordAddon) < 1 then
			selfSay('Great! Simply bring me 100 Iron Ore and one Crude Iron and I will happily {forge} it for you.', cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 and player:getStorageValue(Storage.OutfitQuest.KnightSwordAddon) < 1 then
			if player:removeItem(5892,1) and player:removeItem(5880,100) then
				selfSay('Alright! As a matter of fact, I have one in store. Here you go!', cid)             
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.KnightSwordAddon,1)
				player:addOutfitAddon(131, 1)
				player:addOutfitAddon(139, 1)
				npcHandler.topic[cid] = 0
			else
				selfSay('You do not have all the required items.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] > 1 then 
			selfSay('You already have this outfit!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, 'forge') or msgcontains(msg, 'forge weapon')) then
		selfSay('What would you like me to forge for you? A {knight\'s sword} or a {warrior\'s sword}?', cid)
		npcHandler.topic[cid] = 4
	end
	
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
