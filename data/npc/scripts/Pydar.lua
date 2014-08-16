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

	if msgcontains(msg, 'spark of the phoenix') then
		npcHandler:say('The Spark of the Phoenix is given by me and by the great geomancer of the local earth temple. Do you wish to receive my part of the Spark of the Phoenix for ' .. getBlessingsCost(Player(cid):getLevel()) .. ' gold?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		local player = Player(cid)
		if not player:hasBlessing(4) then
			if player:getStorageValue(Storage.KawillBlessing) == 1 then
				if player:removeMoney(getBlessingsCost(player:getLevel())) then
					player:addBlessing(4)
					player:setStorageValue(Storage.KawillBlessing, 0)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					npcHandler:say('So receive the fire of the suns, pilgrim.', cid)
				else
					npcHandler:say('Oh. You do not have enough money.', cid)
				end
			else
				npcHandler:say('You need the blessing of the great geomancer first.', cid)
			end
		else
			npcHandler:say('You already possess this blessing.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('Maybe another time.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The ways of the gods are imprehensible to mortals. On the other hand, the elements are raw forces and can be understood and tamed.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the head pyromancer of Kazordoon.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Pydar Firefist, Son of Fire, from the Savage Axes.'})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ask around. There\'s a lot to do, jawoll.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That is our world.'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'It\'s the fourth age of the yellow flame.'})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'May the great flame devour them all!'})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Life feeds on fire and ultimately fire will feed on life.'})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A weapon too powerful to be wielded by mortals. It has to be returned to the fire which gave birth to it.'})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If he ever dares enter Kazordoon I will gladly dump him into the lava. Tthe sacred flame shall bring justice upon him.'})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Our city was founded in ancient times. Abandoned by the gods we once fought for, we created a secure haven for our people.'})
keywordHandler:addKeyword({'the big old one'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This mountain is said to be the oldest in the world. It is the place where fire and earth meet and separate at the same time.'})
keywordHandler:addKeyword({'bezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Bezil and Nezil are buying and selling equipment of all kinds.'})
keywordHandler:addKeyword({'nezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Bezil and Nezil are buying and selling equipment of all kinds.'})
keywordHandler:addKeyword({'duria'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'She is the first knight of Kazordoon. She is responsible for teaching our young warriors how to handle an axe.'})
keywordHandler:addKeyword({'etzel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Etzel is a true master of the elements. He is a role-model for our youngsters, jawoll.'})
keywordHandler:addKeyword({'jimbin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He and his wife are running the Jolly Axeman tavern.'})
keywordHandler:addKeyword({'kroox'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He is a smith. If you are looking for exquisite weapons and armour just talk to him.'})
keywordHandler:addKeyword({'maryza'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'She and her husband are running the Jolly Axeman tavern.'})
keywordHandler:addKeyword({'uzgod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Uzgod is a weaponsmith just like those in the old legends.'})
keywordHandler:addKeyword({'durin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Though we are through with the so-called gods, Durin, the first dwarf to aquire divine powers of his own, is considered a protector of our race.'})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Unlike the gods, the elements don\'t use mortals as toys, A skilled mind can understand and even control them to some extent.'})
keywordHandler:addKeyword({'keeper'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The ways of the gods are imprehensible to mortals. On the other hand, the elements are raw forces and can be understood and tamed.'})

npcHandler:setMessage(MESSAGE_GREET, 'Be greeted |PLAYERNAME|! I can smell the scent of a phoenix on you!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the fire in your heart never die, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'May the fire in your heart never die.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
