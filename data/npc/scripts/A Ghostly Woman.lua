local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
	local config = {delay = 20, frequency = 25, message = "Alone ... so alone. So cold."} 
    	if (os.time() - config["delay"]) >= config["frequency"] then
        	config["delay"] = os.time()
        	Npc():say(config["message"], TALKTYPE_SAY)
    	end
    	npcHandler:onThink()    
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "job") and npcHandler.topic[cid] == 0 then
		npcHandler:say("Once I was a member of the order of the nightmare knights. Now I am but a shadow who walks these cold halls.", cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())