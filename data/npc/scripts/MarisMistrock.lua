local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	
	if msgcontains(msg, 'kick') then
		local pos = Position(math.random(32561,32562), math.random(31312,31314), 7)
		player:teleportTo(pos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif msgcontains(msg, 'Mistrock') then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) ~= 1 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar, 1)
			npcHandler:say(
			{
			"Do you smell this? It's the smell of fire... the fire of a forge. Many people searched this rock here for a hidden path, but they haven't found anything. ...",
			"I'd search on Fenrock if I were you. Even though there's snow on the surface, it's still warm underground. There are often caves under fresh lava streams."
			}, cid)
		end
	end
	return true
end

	local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want go back to Yalahar for 50 gold coins?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 50, destination = Position(32649, 31292, 6) })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
    local travelNode = keywordHandler:addKeyword({'fenrock'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want go to the Fenrock for 50 gold coins?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 50, destination = Position(32563, 31313, 7) })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
		keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Yalahar and Fenrock!'})
		keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am Maris, Captain of this ship.'})
		keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am Maris, Captain of this ship.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
