local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "promot") then
		npcHandler:say("Do you want to be promoted in your vocation for 20000 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(30018) == 1 then
			npcHandler:say('You are already promoted.', cid)
		elseif player:getLevel() < 20 then
			npcHandler:say('You need to be at least level 20 in order to be promoted.', cid)
		elseif player:getMoney() < 20000 then
			npcHandler:say('You do not have enough money.', cid)
		elseif configManager.getBoolean(configKeys.FREE_PREMIUM) or isPremium(cid) == true then
			npcHandler:say("Congratulations! You are now promoted.", cid)
			local promotedVoc = getPromotedVocation(player:getVocation())
			player:setVocation(promotedVoc)
			player:removeMoney(20000)
		else
			npcHandler:say("You need a premium account in order to promote.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok, whatever.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())