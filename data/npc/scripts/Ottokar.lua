local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, 'belongings of deceasead') or msgcontains(msg, 'medicine') then
		if player:getItemCount(13506) > 0 then
			npcHandler:say('Did you bring me the medicine pouch?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('I need a {medicine pouch}, to give you the {belongings of deceased}. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getItemCount(13506) > 0 then
			player:removeItem(13506, 1)
			player:addItem(13670, 1)
			local cStorage = player:getStorageValue(Storage.Achievements.DoctorDoctor)
			if cStorage < 100 then
				player:setStorageValue(Storage.Achievements.DoctorDoctor, math.max(0, cStorage) + 1)
			elseif cStorage == 100 then
				player:addAchievement('Doctor! Doctor!')
				player:setStorageValue(Storage.Achievements.DoctorDoctor, 101)
			end
			npcHandler:say('Here you are', cid)
		else
			npcHandler:say('You do not have the required items.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
