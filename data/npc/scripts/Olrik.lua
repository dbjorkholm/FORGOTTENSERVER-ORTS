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
	if(msgcontains(msg, "measurements")) then
		if player:getStorageValue(250) == 33 then
			npcHandler:say("My measurements? Listen, lets make that a bit more exciting ... No, no, not what you think! I mean let's gamble. I will roll a dice. If I roll a 6 you win and I'll tell you what you need to know, else I win and get 5 gold. Deal? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if player:getMoney() >= 5 then
			player:removeMoney(5)
			number = math.random(1, 6)
			if(number ~= 6) then
				npcHandler:say("Ok, here we go ... " .. number .. "! You lose! Try again.", cid)
			else
				npcHandler:say("Ok, here we go ... " .. number .. "! You have won! How lucky you are! So listen ...<tells you what you need to know> ", cid)
				player:setStorageValue(250, 34)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
