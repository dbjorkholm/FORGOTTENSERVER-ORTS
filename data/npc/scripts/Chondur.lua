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
	elseif msgcontains(msg, "stampor") or msgcontains(msg, "mount") then
		if not player:hasMount(11) then
				npcHandler:say("You did bring all the items I requqested, cuild. Good. Shall I travel to the spirit realm and try finding a stampor compasion for you?", cid)
				npcHandler.topic[cid] = 1
		else
			npcHandler:say("You already have stampor mount.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(13299, 50) and player:removeItem(13301, 30) and player:removeItem(13300, 100) then
				npcHandler:say({"Ohhhhh Mmmmmmmmmmmm Ammmmmgggggggaaaaaaa ...","Aaaaaaaaaahhmmmm Mmmaaaaaaaaaa Kaaaaaamaaaa ...","Brrt! I think it worked! It's a male stampor. I linked this spirit to yours. You can probably already summon him to you ...","So, since me are done here... I need to prepare another ritual, so please let me work, cuild."}, cid, 0, 1, 4000)
				player:addMount(11)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry you don't have the necessary items.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			if player:getStorageValue(5941) >= 1 then
				player:setStorageValue(88, os.time())
				npcHandler:say("<mumblemumble> Sha Kesh Mar!", cid)
				player:removeItem(5941, 1)
				player:addItem(5942, 1)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "wooden stake") then
		if npcHandler.topic[cid] < 1 then
			if player:getStorageValue(87) == 12 and player:getStorageValue(5941) >= 1 then
				if player:getStorageValue(88) + 7 * 24 * 60 * 60 < os.time() then
					npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a wooden stake, I'll bless it for you. <chuckles>", cid)
					npcHandler.topic[cid] = 2
				else
					npcHandler:say("Sorry I'm still exhausted from the last ritual. come back later and try again.", cid)
					npcHandler.topic[cid] = 0
				end
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(5941) >= 1 then
				npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
				npcHandler.topic[cid] = 3
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())			