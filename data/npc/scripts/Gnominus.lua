local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

-- transcript for buying fresh mushroom beer is probably wrong except for the case where you buy it
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, 'recruitment') then
		local player = Player(cid)
		if player:getStorageValue(900) == 3 then
			npcHandler:say('Your examination is quite easy. Just step through the green crystal apparatus in the south! We will examine you with what we call g-rays. Where g stands for gnome of course ...', cid)
			npcHandler:say('Afterwards walk up to Gnomedix for your ear examination.', cid)
			talkState[talkUser] = 1
		end
	elseif msgcontains(msg, 'tavern') then
			npcHandler:say('I provide the population with some fresh alcohol-free mushroom {beer}!', cid)
	elseif msgcontains(msg, 'beer') then
			npcHandler:say('Do you want some mushroom beer for 10 gold?', cid)
			talkState[talkUser] = 2
	elseif talkState[talkUser] == 1 then
		if msgcontains(msg, 'apparatus') then
			npcHandler:say('Don\'t be afraid. It won\'t hurt! Just step in!', cid)
			Player(cid):setStorageValue(900, 4)
			talkState[talkUser] = 0
		end
	elseif talkState[talkUser] == 2 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:getMoney() >= 10 then
				npcHandler:say('And here it is! Drink it quick, it gets stale quite fast!', cid)
				player:removeMoney(10)

				local beerItem = player:addItem(18305)
				if beerItem then
					beerItem:decay()
				end
			else
				npcHandler:say('You do not have enough money.', cid)
			end
		else
				npcHandler:say('Come back later.', cid)
		end
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hi there! Welcome to my little {tavern}.')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())