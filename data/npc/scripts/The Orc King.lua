local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(83) ~= 1 then
		player:setStorageValue(83, 1)
		local creatures = { 'Slime', 'Slime', 'Slime', 'Orc Warlord', 'Orc Warlord', 'Orc Leader', 'Orc Leader', 'Orc Leader' }
		for i = 1, #creatures do
			Game.createMonster(creatures[i], Npc():getPosition())
		end
		selfSay('Arrrrgh! A dirty paleskin! To me my children! Kill them my guards!', TALKTYPE_SAY)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!')
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)

	-- Mission 3 - Orc Fortress
	if msgcontains(msg, 'lamp') then
		if player:getStorageValue(GreenDjinn.MissionStart + 3) == 1 or player:getStorageValue(BlueDjinn.MissionStart + 3) == 1 then
			npcHandler:say({'King: I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...', 'Who do you want to trap in this cursed lamp?'}, cid)
			npcHandler.topic[cid] = 1
		end
	-- Mission 3 - Orc Fortress
	elseif msgcontains(msg, 'malor') and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(GreenDjinn.MissionStart + 3) == 1 then
			player:setStorageValue(GreenDjinn.MissionStart + 3, 2)
		elseif player:getStorageValue(BlueDjinn.MissionStart + 3) == 1 then
			player:setStorageValue(BlueDjinn.MissionStart + 3, 2)
		end
		player:addItem(2344, 1)
		npcHandler:say('I was waiting for this day! Take the lamp and let Malor feel my wrath!', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())