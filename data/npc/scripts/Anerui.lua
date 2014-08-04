local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mistress of the hunt. At this place you may buy the food our hunts provide."})
keywordHandler:addKeyword({'hunt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hunting is an art, practiced too often by diletantes. Every fool with a bow or a spear considers himself a hunter."})
keywordHandler:addKeyword({'bow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bow, arrow, and spear are the hunters' best friends. In the northeast of the town one of us may sell such tools."})
keywordHandler:addKeyword({'hunter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hunters live a life of freedom and closeness to nature, unlike a simple farmer or bugherder."})
keywordHandler:addKeyword({'nature'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nature is not a friend but an unforgiving teacher, and the lessons we have to learn are endless."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Watch the sky, it will tell you."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I guess it's a human god for the human sight of nature. I have not much knowledge of this entity."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If they ever existed they are gone now."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Kuridai are too agressive not only to people but also to the enviroment. They lack any understanding of the balance that we know as nature."})
keywordHandler:addKeyword({'balance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The balance of nature, of course. It's everywhere, so don't ask but observe and learn."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We try to live in harmony with the forces of nature, may they be living or unliving."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The humans are a loud and ugly race. They lack any grace and are more kin to the orcs then to us."})
keywordHandler:addKeyword({'death'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life and death are significant parts of the balance."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life and death are significant parts of the balance."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I despise their presence in our town, but it may be a necessary evil."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is the race to which I belong."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The magic they wield is all that matters to them."})

npcHandler:setMessage(MESSAGE_GREET, "Ashari |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Asha Thrazi.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Asha Thrazi.")
npcHandler:addModule(FocusModule:new())
