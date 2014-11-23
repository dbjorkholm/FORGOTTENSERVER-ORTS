local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local config = {
	[1] = 'Ashari, |PLAYERNAME|. How... nice to see a human taking interest in a beautiful art such as music.',
	[2] = 'Ashari, |PLAYERNAME|... that sound was.. interesting.',
	[3] = 'Ashari, |PLAYERNAME|. You\'ve made some... progress playing the lyre, haven\'t you..? I want to believe you have.',
	[4] = '|PLAYERNAME|. My regular visitor. I certainly... appreciate your efforts to entertain me, but let me assure you, I\'m quite comfortable up here by myself. Alone. In silence.',
	[5] = 'Ashari, |PLAYERNAME|. I\'m starting to feel a little sorry... for your lyre. Being forced to produce such noise must be a tragic fate.',
	[6] = '|PLAYERNAME|! You\'re driving me insane! I beg you, take your lyre away from this sacred and peaceful place.',
	[7] = '|PLAYERNAME|! My ears! I\'d prefer listening to drunken dwarves rambling all day to the sound of your lyre! Please, at least get it tuned. Here, you can have this elvish diapason.'
}

local function greetCallback(cid)
	local player = Player(cid)
	local lyreProgress = player:getStorageValue(Storage.Diapason.Lyre)
	local greetMessage = config[lyreProgress]
	if greetMessage
			and player:getStorageValue(Storage.Diapason.Edala) == 1
			and player:getStorageValue(Storage.Diapason.EdalaTimer) < os.time() then
		player:setStorageValue(Storage.Diapason.Edala, 0)
		player:setStorageValue(Storage.Diapason.EdalaTimer, os.time() + 86400)
		if lyreProgress == 7 then
			player:setStorageValue(Storage.Diapason.Lyre, 8)
			player:addItem(13536, 1)
		end
		npcHandler:setMessage(MESSAGE_GREET, greetMessage:gsub('|PLAYERNAME|', player:getName()))
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Ashari, |PLAYERNAME|.')
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'heal') then
		if player:getHealth() >= 50 then
			npcHandler:say('You aren\'t looking that bad. Sorry, I can\'t help you.', cid)
			return true
		end

		player:addHealth(50 - player:getHealth())
		local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED}
		for i = 1, #conditions do
			if player:getCondition(conditions[i]) then
				player:removeCondition(conditions[i])
			end
		end
		npcHandler:say('You are hurt, my child. I will heal your wounds.', cid)
	elseif msgcontains(msg, 'suns') then
		npcHandler:say('Would you like to receive that protection for a sacrifice of ' .. getBlessingsCost(player:getLevel()) .. ' gold, child?', cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if player:hasBlessing(3) then
				npcHandler:say('You already possess this blessing.', cid)
				return true
			end

			if not player:removeMoney(getBlessingsCost(player:getLevel())) then
				npcHandler:say('Oh. You do not have enough money.', cid)
				return true
			end

			player:addBlessing(3)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say('So receive the fire of the suns, pilgrim.', cid)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('Fine. You are free to decline my offer.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'blessings'}, StdModule.say, {npcHandler = npcHandler, text = 'There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here.'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, text = 'You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais.'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, text = 'The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, text = 'The druids north of Carlin will provide you with the embrace of Tibia.'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, text = 'Talk to the hermit Eremo on the isle of Cormaya about this blessing.'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Asha Thrazi, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Asha Thrazi, |PLAYERNAME|!')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage({'hi', 'hello', 'ashari'})
focusModule:addFarewellMessage({'bye', 'farewell', 'asgha thrazi'})
npcHandler:addModule(focusModule)
