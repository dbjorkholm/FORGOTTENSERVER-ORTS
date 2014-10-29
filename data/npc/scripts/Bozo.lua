local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Come chat with ol\' Bozo!',
	'Do you know the one with the dragon? Where - and then ... hahahaha! Oh no, I guess I ruined it.',
	'The fools\' guild? Are you serious? No, of course not! Hahaha!',
	'Welcome, welcome, step closer!'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_SORCERER, 'I wanted to become a sorcerer, too, but I was overqualified!'}, {'The good thing about them is that they can\'t be at two places at the same time.'}}})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_DRUID, 'I wanted to become a druid, too, but I was overqualified!'}, {'I wonder if they love my water squirt flowers as much as all other plants.'}}})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_PALADIN, 'I wanted to become a paladin, too, but I was overqualified!'}, {'They are the king\'s favourites, because they know how to \'bow\'.'}}})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_KNIGHT, 'I wanted to become a knight, too, but I was overqualified!'}, {'Did you notice that old knights have their scars just on their backs?'}}})
keywordHandler:addKeyword({'here'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A fitting place for a {jester}. I guess there are worse {jobs} around.'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Bozo: Nah, no jests about His Royal Highness.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I rarely leave the castle. It\'s really stressful to be as popular as me.'})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This castle is my home. A fitting place for a jester and all other fools. Feel welcome.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m a jester, not a doctor!'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Bozo. But it\'s more than a name, it\'s a lifestyle for me!'})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That\'s me: Bozo, the jester!'})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ever since the first guild was created, there is a great demand of jesters and fools to join them.'})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sell? Hmm, I know a little about magic and by chance I can sell you a truly unusual {weapon}.'})
keywordHandler:addKeyword({'joke'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I know some \'monstrous\' jokes!'})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I know the newest jokes in tibia.'})
keywordHandler:addKeyword({'how', 'are', 'you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Thank you, I\'m fine, the gods are with me.'})
keywordHandler:addKeyword({'necromant', 'nectar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pheeew! That sounds disgusting! Are you a cook at Frodo\'s?'})
keywordHandler:addKeyword({'necromant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Don\'t feed the necromants.'})
keywordHandler:addKeyword({'dog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are we talking about Noodles?'})
keywordHandler:addKeyword({'poodle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are we talking about Noodles?'})
keywordHandler:addKeyword({'noodles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hey, the little one is almost as funny as me!'})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Better don\'t mess with sorcerers!'})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'She\'s pretty but too serious for my taste.'})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Humourless old guy! Once, he turned me into a frog for painting his distasteful cave in pink.'})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A man of steel with a stomach of wax. Never offer him a beer!'})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He\'s my baby brother. If you tell him I sent you, he will grant you an extra spell or two.'})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He sells spell scrolls each day at midnight, but you have to address him that very second.'})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I better make no jokes about THIS matter.'})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Did you know that he sells a \'power axe of doom\' now? Run and buy it, he only has got three in store.'})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He would make a fine jester, too.'})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I know a lot of monster jokes. Just tell me a monster\'s name, come on.'})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why are the experienced heroes quicker than others? ... The demons love fast food!'})
keywordHandler:addKeyword({'ghoul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do ghouls buy their robes? ... In a boooohtique!'})
keywordHandler:addKeyword({'dragon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why do dragons breathe fire? ... They ate too many sorcerers in chilli sauce!'})
keywordHandler:addKeyword({'orc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why do orcs have green skin? ... They ate at Frodo\'s!'})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'How many eyes does a cyclops have? ... One for each IQ point they have!'})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you believe half the rumours he\'s spreading, you will get in a lot of trouble.'})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you are a bad jester, you get a chance to visit them now and then.'})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'What do all little minotaurs want to become when they are grown-ups? ... Cowboys, of course!'})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why do trolls live underground? ... Because there are so many pks on the surface!'})
keywordHandler:addKeyword({'bonelord'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why are bonelords so ugly? ... Because their mom and dad were bonelords, too!'})
keywordHandler:addKeyword({'rat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why does the rat have a wooden leg? ... Because it is a former pirate!'})
keywordHandler:addKeyword({'spider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why did the spider cross the road? ... Because it ... oh you already know this one!?'})
keywordHandler:addKeyword({'hugo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I had a cousin named like that.'})
keywordHandler:addKeyword({'cousin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He died some years ago.'})
keywordHandler:addKeyword({'durin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Isn\'t he the author of the book \'Fun with Demons\'?'})
keywordHandler:addKeyword({'stephan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He is kind of a father figure to me. Of course he denies all kinship to me.'})
keywordHandler:addKeyword({'steve'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He\'s a smart one. I heared he hid in a foreign country as the first bugs showed up.'})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am not foolish enough to believe in the existence of this weapon.'})
keywordHandler:addKeyword({'wall', 'carving'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oh, I saw some demon carvings in the dungeons as I hid there after a little joke on old Stutch.'})
keywordHandler:addKeyword({'demon', 'carving'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Yes, they showed demons, seven actually, dancing around a sword! In something like a flaming pit.'})
keywordHandler:addKeyword({'flaming', 'pit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ah, don\'t ask me! Usually mages and mystics know more about such stuff.'})

local jobKeyword = keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m the royal jes ... uhm ... the royal tax-collector! Do you want to pay your taxes?'})
	jobKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, price = 50, text = {{STDMODULE_REMOVE_MONEY, 'Thank you very much. I will have a drink or two on your health!'}, {'Come back, when you have enough money.'}}, reset = true})
	jobKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well, perhaps later.', reset = true})

local magicKeyword = keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I actually know some spells! Do you want to learn how to \'lessen your load\' for 200 gold?'})
	magicKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, price = 200, text = {{STDMODULE_REMOVE_MONEY, 'Here you are, I already lessened your load.'}, {'Come back, when you have enough money.'}}, reset = true})
	magicKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t know what offer you are missing!', reset = true})

local spellKeyword = keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I actually know some spells! Do you want to learn how to \'lessen your load\' for 200 gold?'})
	spellKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, price = 200, text = {{STDMODULE_REMOVE_MONEY, 'Here you are, I already lessened your load.'}, {'Come back, when you have enough money.'}}, reset = true})
	spellKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t know what offer you are missing!', reset = true})

local weaponKeyword = keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to buy a \'mace of the fury\' for 250 gold?'})
	weaponKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, price = 250, itemid = 2570, amount = 1, text = {{STDMODULE_REMOVE_MONEY, STDMODULE_ADD_ITEM, 'And here it is, it suits you well!'}, {'Come back, when you have enough money.'}}, reset = true})
	weaponKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You dont know what offer you have passed!', reset = true})

local kissKeyword = keywordHandler:addKeyword({'kiss'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_MALE, STDMODULE_RELEASE_FOCUS, 'Uh, go away!'}, {'Do you want to kiss me?'}}})
	kissKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, effect = 13, text = {{STDMODULE_EFFECT, 'Uh, oh! ... I am seeing stars!'}}, reset = true})
	kissKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pah, I didn\'t want to kiss you anyway!', reset = true})

local ladyKeyword = keywordHandler:addKeyword({'lady'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = {{STDMODULE_IS_MALE, STDMODULE_CANCEL, 'Well, women don\'t behave necessarily in a ladylike way just because they dress like one!'}, {'Has any man said to you that you\'re not only beautiful but also intelligent?'}}})
	ladyKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This is a world of fantasy and full of surprises!', reset = true})
	ladyKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well, think about it!', reset = true})


local function greetCallback(cid)
	if Player(cid):getSex() == PLAYERSEX_MALE then
		npcHandler:setMessage(MESSAGE_GREET, 'Hi there, how\'s it hanging, |PLAYERNAME|! What brings you {here}?')
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Hello, hello, hello, little lady |PLAYERNAME|! What brings you {here}?')
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'jester') or msgcontains(msg, 'fool') or msgcontains(msg, 'join') then
		-- What a foolish quest
	end
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'Remember: A joke a day keeps the ghouls away!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Hey! Fools have feelings too.')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
