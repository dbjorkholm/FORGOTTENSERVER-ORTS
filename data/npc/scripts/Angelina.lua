local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "The gods must be praised that I am finally saved. I do not have many worldly possessions, but please accept a small reward, do you?")
	elseif	player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) >= 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Thanks for saving my life! Should I teleport you out of the Dark Cathedral?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "Yes") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) < 1 then
			npcHandler:say("OI will tell you a small secret now. My friend Lynda in Thais can create a blessed wand. Greet her from me, maybe she will aid you.", player)
			player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
		elseif player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) >= 1 then
			local port = {x = 32659, y = 32340, z = 7}
			player:teleportTo(port)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
return true
end



npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
