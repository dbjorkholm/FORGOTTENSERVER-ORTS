local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'fugio') then
		if player:getStorageValue(Storage.WhiteRavenMonasteryQuest.Diary) == -1 then
			npcHandler:say('To be honest, I fear the omen in my dreams may be true. Perhaps Fugio is unable to see the danger down there. Perhaps ... you are willing to investigate this matter?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, 'diary') then
		if player:getStorageValue(Storage.WhiteRavenMonasteryQuest.Diary) == 1 then
			npcHandler:say('Do you want me to inspect a diary?', cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Thank you very much! From now on you may open the warded doors to the catacombs.', cid)
			player:setStorageValue(Storage.WhiteRavenMonasteryQuest.Diary, 1)
		elseif npcHandler.topic[cid] == 2 then
			if not player:removeItem(2325, 1) then
				npcHandler:say('Uhm, as you wish.', cid)
				return true
			end

			npcHandler:say('By the gods! This is brother Fugio\'s handwriting and what I read is horrible indeed! You have done our order a great favour by giving this diary to me! Take this blessed Ankh. May it protect you in even your darkest hours.', cid)
			player:addItem(2327, 1)
			player:setStorageValue(Storage.WhiteRavenMonasteryQuest.Diary, 2)
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] ~= 0 then
		npcHandler:say('Uhm, as you wish.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! Feel free to tell me what has brought you here.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Come back soon.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
