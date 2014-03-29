local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                        npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	-- GREET
	if (msg == "hi" or msg == "hello") and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, 83) < 1) then
			npcHandler:say("Arrrrgh! A dirty paleskin! To me my children! Kill them my guards!", cid)
			setPlayerStorageValue(cid, 83, 1)
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
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+3) == 1 or getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) == 1) then
			npcHandler:say({"King: I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...","Who do you want to trap in this cursed lamp?"}, cid, 0, 1, 2200)
			talkState[talkUser] = 1
		end
	-- Mission 3 - Orc Fortress
	elseif(msgcontains(msg, "malor")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,  GreenDjinn.MissionStart+3) == 1) then
				setPlayerStorageValue(cid,  GreenDjinn.MissionStart+3, 2)
			elseif(getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) == 1) then
				setPlayerStorageValue(cid, BlueDjinn.MissionStart+3, 2)
			end
			npcHandler:say("I was waiting for this day! Take the lamp and let Malor feel my wrath!", cid)
			talkState[talkUser] = 0
			doPlayerAddItem(cid, 2344, 1)
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("We will meet again.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)