local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "myra") then
		local player, storage = Player(cid), 50011
		if player:getStorageValue(storage) == 10 then
			player:addOutfitAddon(138, 2)
			player:addOutfitAddon(133, 2)
			player:setStorageValue(storage, 11)
			npcHandler:say({"Bah, I know. I received some sort of 'nomination' from our outpost in Port Hope. ...", "Usually it takes a little more than that for an award though. However, I honour Myra's word. ..."}, cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
