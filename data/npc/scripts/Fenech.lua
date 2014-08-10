local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local rnd_sounds = 0
function onThink()
	if rnd_sounds < os.time() then
		rnd_sounds = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Offering all sorts of magic equipment.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if isSorcerer(cid) or isDruid(cid) then
			if player:getStorageValue(50079) == -1 then
				npcHandler:say('So you ask me for a {' .. ItemType(items[player:getVocation():getId()]):getName() .. '} to begin your adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say('What? I have already gave you one {' .. ItemType(items[player:getVocation():getId()]):getName() .. '}!', cid)
			end
		else
			npcHandler:say('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(items[player:getVocation():getId()], 1)
			npcHandler:say('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(50079, 1)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and isInArray({1}, npcHandler.topic[cid]) == true then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be mourned pilgrim in flesh and welcome to the magic store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May enlightenment be your path.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at wands or runes?")
npcHandler:addModule(FocusModule:new())
