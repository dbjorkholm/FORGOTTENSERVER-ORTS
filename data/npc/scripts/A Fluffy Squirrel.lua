local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()
	local config = {delay = 20, frequency = 25, message = "Chchch."}
	if (os.time() - config["delay"]) >= config["frequency"] then
		config["delay"] = os.time()
		Npc():say(config["message"], TALKTYPE_SAY)
	end
	npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())
