local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"cormaya", "back", "pemaret", "passage"}, msg) then
		npcHandler:say("Should I teleport you back to Pemaret?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:teleportTo(Position(33288, 31956, 6))
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "solitude") then
		npcHandler:say({"Would you like to receive that protection for a sacrifice of " .. getBlessingsCost(player:getLevel()) .. " gold, child?"}, cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if not player:hasBlessing(5) then
			if player:removeMoney(getBlessingsCost(player:getLevel())) then
				player:addBlessing(5)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("So receive the wisdom of solitude, pilgrim.", cid)
			else
				npcHandler:say("Oh. You do not have enough money.", cid)
			end
		else
			npcHandler:say("You already possess this blessing.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Fine. You are free to decline my offer.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'blessings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here.'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais.'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The druids north of Carlin will provide you with the embrace of Tibia.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
