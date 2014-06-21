local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, 'belongings of deceasead') or msgcontains(msg, 'medicine') then
		if getPlayerItemCount(cid,13506) >= 1 then
			selfSay('Did you bring me the medicine pouch?', cid)
			npcHandler.topic[cid] = 1
		else
			selfSay('I need a {medicine pouch}, to give you the {belongings of deceased}. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		local player = Player(cid)
		if player:getItemCount(13506) >= 1 then
			player:removeItem(13506, 1)
			player:addItem(13670, 1)
			selfSay('Here you are', cid)
		else
			selfSay('You do not have the required items.', cid)
		end
		npcHandler.topic[cid] = 0
	end
   return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
