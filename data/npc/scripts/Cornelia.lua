local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"adorn", "armour"}, msg) then
		if player:getStorageValue(Storage.OutfitQuest.WarriorShoulderAddon) == 5 then
			player:addOutfitAddon(142, 1)
			player:addOutfitAddon(134, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:setStorageValue(Storage.OutfitQuest.WarriorShoulderAddon, 6)
			npcHandler:say({"Ah, you must be the hero Trisha talked about. I'll prepare the shoulder spikes for you.", " Finished! Since you are a man, I thought you probably wanted two. Men always want that little extra status symbol. <giggles>"}, cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())