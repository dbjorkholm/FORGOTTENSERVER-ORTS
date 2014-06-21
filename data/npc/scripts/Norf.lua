local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, "help") then
		npcHandler:say("You aren't looking that bad. Sorry, I can't help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes.", cid)
	elseif msgcontains(msg, "pilgrimage") then
		npcHandler:say("I am here to provide one of the five {blessings}.", cid)
	elseif msgcontains(msg, "blessings") then
		npcHandler:say("There are five different blessings available in five sacred places. These blessings are: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}.", cid)
	elseif msgcontains(msg, "spiritual") then
		npcHandler:say("Here in the whiteflower temple you may receive the blessing of spiritual shielding. But we must ask of you to sacrifice " .. getBlessingsCost(Player(cid):getLevel()) .. " gold. Are you still interested?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "phoenix") then
		npcHandler:say("The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.", cid)
	elseif msgcontains(msg, "embrace") then
		npcHandler:say("The druids north of Carlin will provide you with the embrace of Tibia.", cid)
	elseif msgcontains(msg, "suns") then
		npcHandler:say("You can ask for the blessing of the two suns in the suntower near Ab'Dendriel.", cid)
	elseif msgcontains(msg, "solitude") then
		npcHandler:say("Talk to the hermit Eremo on the isle of Cormaya about this blessing.", cid)
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		local player = Player(cid)
		if not player:hasBlessing(1) then
			if player:removeMoney(getBlessingsCost(player:getLevel())) then
				player:addBlessing(1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("So receive the shielding of your spirit, pilgrim.", cid)
			else
				npcHandler:say("Oh. You do not have enough money.", cid)
			end
		else
			npcHandler:say("You already possess this blessing.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Ok. Suits me.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, Pilgrim. How may I {help} you? Are you in need of {healing}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())