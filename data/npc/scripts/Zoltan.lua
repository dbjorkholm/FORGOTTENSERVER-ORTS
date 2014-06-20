local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "myra") then
		if player:getStorageValue(50011) == 10 then
			player:addOutfitAddon(138, 2)
			player:addOutfitAddon(133, 2)
			player:setStorageValue(50011, 11)
			npcHandler:say({"Bah, I know. I received some sort of 'nomination' from our outpost in Port Hope. ...", "Usually it takes a little more than that for an award though. However, I honour Myra's word. ..."}, cid)
		end
	elseif msgcontains(msg, "proof") then
		if not player:hasOutfit(player:getSex() == 0 and 141 or 130, 2) then
			npcHandler:say("... I cannot believe my eyes. You retrieved this hat from Ferumbras' remains? That is incredible. If you give it to me, I will grant you the right to wear this hat as addon. What do you say?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("You already have second " .. (player:getSex() == 0 and "summoner" or "mage") .. " addon.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:removeItem(5903, 1) then
			player:addOutfitAddon(141, 2)
			player:addOutfitAddon(130, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			npcHandler:say("I bow to you, player, and hereby grant you the right to wear Ferumbras´ hat as accessory. Congratulations!", cid)
		else
			npcHandler:say("Sorry you don't have the ferumbras hat.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())