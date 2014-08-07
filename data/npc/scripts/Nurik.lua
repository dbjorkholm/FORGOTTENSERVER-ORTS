local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)
	local playerOutfit = player:getOutfit()
	if playerOutfit.lookType == 69 then -- dwarf looktype
		if player:getStorageValue(Storage.thievesGuild.Mission04) == 6 then
			npcHandler:say('It\'s .. It\'s YOU! At last!! So what\'s this special proposal you would like to make, my friend?', cid)
			npcHandler.topic[cid] = 1
		end
	else
		npcHandler:say('Greetings, ' .. player:getName() .. '', cid)
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, 'dwarven bridge') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Wait a minute! Do I get that right? You\'re the owner of the dwarven bridge and you are willing to sell it to me??', cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say({'That\'s just incredible! I\'ve dreamed about acquiring the dwarven bridge since I was a child! Now my dream will finally become true. ...', 'And you are sure you want to sell it? I mean really, really sure?'}, cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say('How splendid! Do you have the necessary documents with you?', cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say('Oh my, oh my. I\'m so excited! So let\'s seal this deal as fast as possible so I can visit my very own dwarven bridge. Are you ready for the transaction?', cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(8694, 1) then
				player:addItem(8699, 1)
				player:setStorageValue(Storage.thievesGuild.Mission04, 7)
				npcHandler:say({'Excellent! Here is the painting you requested. It\'s quite precious to my father, but imagine his joy when I tell him about my clever deal! ...', 'Now leave me alone please. I have to prepare for my departure. Now my family will not call me a squandering fool anymore!'}, cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
