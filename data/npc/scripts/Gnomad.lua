local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

local player = Player(cid)
	if(msgcontains(msg, "warzones")) then
			npcHandler:say({
				"You will encounter quite a lot of beasties in the area ahead of us. The end of the cave-system is where the trouble begins though. The monsters here all serve some massive creature only known as Deathstrike. ...",
				"The creature is hidden in a well protected chamber. The good news is, we've managed to erect a crystal structure close to the cave that is able to breach its defence and teleport someone into the chamber. ...",
				"The bad new is that the crystals need a specific charge before they can work. As soon as the crystals begin to charge up, Deathstrikes' minions will frenzy and spawn in waves to crush all opposition. ...",
				"You will have to kill them quite fast, to not be overwhelmed by their numbers! Our own tries to breach the defence has proven that you'll have to endure six waves until the teleporter to Deathtstrikes' cave opens for a short 30 seconds. ...",
				"Use the GREEN command crystal in the cave to begin the charging of the teleport! Good luck."
			}, cid)
			npcHandler.topic[cid] = 0
			
	elseif(msgcontains(msg, "job")) then
			npcHandler:say(" I'm the gnomish tactical advisor for this area!", cid)
			npcHandler.topic[cid] = 0
			
	elseif(msgcontains(msg, "crystals")) then
			npcHandler:say({
				"Ah you are amazed by our crystals, aren't you? Well, you have only seen a tiny fraction of what they are able to do."
			}, cid)
			npcHandler.topic[cid] = 0
			
	elseif(msgcontains(msg, "mushrooms")) then
			npcHandler:say({
				" In the last century mushrooms have become more and more important for producing raw materials and tools and less important for sustenance."
			}, cid)
			npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, "gnomes")) then
			npcHandler:say({
				"We gnomes are masters of growing and working crystals and we also mastered the raising of a variety of mushrooms for different purposes."
			}, cid)
			npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
