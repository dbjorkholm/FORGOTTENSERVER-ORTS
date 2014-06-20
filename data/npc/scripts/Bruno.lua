local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, I sell freshly caught fish. You like some? Of course, you can buy more than one at once. *grin* Just ask me for a {trade}."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, I sell freshly caught fish. You like some? Of course, you can buy more than one at once. *grin* Just ask me for a {trade}."})
keywordHandler:addKeyword({'fish'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, I sell freshly caught fish. You like some? Of course, you can buy more than one at once. *grin* Just ask me for a {trade}."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Bruno."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job is to catch fish and to sell them here."})
keywordHandler:addKeyword({'marlene'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah yes, my lovely wife. God forgive her, but she can't stop talking. So my work is a great rest for my poor ears. *laughs loudly*"})
keywordHandler:addKeyword({'graubart'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like this old salt. I learned much from him. Whatever. You like some fish? *grin*"})

function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Ahoi, " .. player:getName() .. ". You want to buy some fresh fish?")
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
