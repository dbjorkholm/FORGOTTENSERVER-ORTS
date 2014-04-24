local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

item = 'You do not have the required items.'
done = 'Here you are.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
		if msgcontains(msg, 'belongings of deceasead') or msgcontains(msg, 'medicine') then
			if getPlayerItemCount(cid,13506) >= 1 then
				selfSay('Did you bring me the medicine pouch?', cid)
				talk_state = 1
			else
				selfSay('I need a {medicine pouch}, to give you the {belongings of deceased}. Come back when you have them.', cid)
				talk_state = 0
			end

			elseif msgcontains(msg, 'yes') and talk_state == 1 then
			talk_state = 0
			if getPlayerItemCount(cid,13506) >= 1 then
			if doPlayerRemoveItem(cid,13506, 1) == TRUE then
							selfSay(done, cid)
			doPlayerAddItem(cid, 13670, 1)
			end
			else
				selfSay(item, cid)
			end
       end
   return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
