local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "wooden stake") then
		if player:getStorageValue(87) == 10 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
				npcHandler.topic[cid] = 1
			end
		end
	elseif msgcontains(msg, "cough syrup") then
		if player:getStorageValue(12120) == 3 then
			npcHandler:say("The only person who might have some cough syrup is this druid Ustan. You find him in the tavern. Hmmm the tavern ... <hicks>", cid)
			npcHandler.topic[cid] = 2
			player:setStorageValue(12120, 4)
			player:setStorageValue(12122, 2) -- The Ape City Questlog - Mission 2: The Cure
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(5941) >= 1 then
				player:setStorageValue(87, 11)
				npcHandler:say("So receive my prayer: 'Your hand shall be guided - your feet shall walk in <hicks> harmony'. Now, bring your stake to Tyrias in <hicks> Liberty Bay for the next line of the prayer. I will inform him what to do. ", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())