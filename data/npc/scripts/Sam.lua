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
	end
	if msgcontains(msg, "adorn") or msgcontains(msg, "helmet") or msgcontains(msg, "outfit") or msgcontains(msg, "addon") then
		if player:getStorageValue( Storage.OutfitQuest.KnightHatAddon) == 5 then
			npcHandler:say("Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Your helmet is finished, I hope you like it.", cid)
			player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 6)
			player:addOutfitAddon(139, 2)
			player:addOutfitAddon(131, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
 
	if msgcontains(msg, "old backpack") then
		if player:getStorageValue( 330) < 1 then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid, 3960) >= 1 then
				npcHandler:say({"Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...",
								"I will mail him about you immediately. Just tell him, his old buddy Sam is sending you."}, cid, 0, 1, 3500)
				player:setStorageValue( 330, 1)
				player:removeItem( 3960, 1)
			else
				npcHandler:say("You don't have it...", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 0 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
