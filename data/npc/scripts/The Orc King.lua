local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	-- GREET
	if (msg == "hi" or msg == "hello") and (not npcHandler:isFocused(cid)) then
		if player:getStorageValue(83) < 1 then
			npcHandler:say("Arrrrgh! A dirty paleskin! To me my children! Kill them my guards!", cid)
			player:setStorageValue(83, 1)
			doSummonCreature("Slime", getThingPos(getNpcCid()))
			doSummonCreature("Slime", getThingPos(getNpcCid()))
			doSummonCreature("Slime", getThingPos(getNpcCid()))
			doSummonCreature("Orc Warlord", getThingPos(getNpcCid()))
			doSummonCreature("Orc Warlord", getThingPos(getNpcCid()))
			doSummonCreature("Orc Leader", getThingPos(getNpcCid()))
			doSummonCreature("Orc Leader", getThingPos(getNpcCid()))
			doSummonCreature("Orc Leader", getThingPos(getNpcCid()))
		else
			npcHandler:say("Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!", cid)
			npcHandler:addFocus(cid)
		end
	end
	-- GREET

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- Mission 3 - Orc Fortress
	if(msgcontains(msg, "lamp")) then
		if player:getStorageValue(GreenDjinn.MissionStart+3) == 1 or player:getStorageValue(BlueDjinn.MissionStart+3) == 1 then
			npcHandler:say({"King: I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...","Who do you want to trap in this cursed lamp?"}, cid, 0, 1, 2200)
			npcHandler.topic[cid] = 1
		end
	-- Mission 3 - Orc Fortress
	elseif(msgcontains(msg, "malor")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getStorageValue(GreenDjinn.MissionStart+3) == 1 then
				player:setStorageValue(GreenDjinn.MissionStart+3, 2)
			elseif player:getStorageValue(BlueDjinn.MissionStart+3) == 1 then
				player:setStorageValue(BlueDjinn.MissionStart+3, 2)
			end
			npcHandler:say("I was waiting for this day! Take the lamp and let Malor feel my wrath!", cid)
			npcHandler.topic[cid] = 0
			doPlayerAddItem(cid, 2344, 1)
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("We will meet again.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
