local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am miss Penny, your secretary."})
keywordHandler:addKeyword({'penny'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yep, Penny's my name. You seem to be as smart as you're talkative."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a secretary. I'm organising all those papers and your mail."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'record'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'paper'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'mail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can get a letter from me."})
keywordHandler:addKeyword({'?'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't stare at me."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome home, Sir |PLAYERNAME|.")
--npcHandler:setMessage(MESSAGE_GREET, "Welcome home, Sir/Lady |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, and may Justice be with you!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Wait... will you take me a diamond when you're back?")
npcHandler:addModule(FocusModule:new())
