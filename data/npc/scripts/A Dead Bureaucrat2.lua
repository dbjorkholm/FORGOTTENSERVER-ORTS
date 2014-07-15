local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)

	if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 15 then
		player:setStorageValue(Storage.pitsOfInferno.Pumin, 16)
		npcHandler:say("Hey! You are back! How can I help you this time?", cid)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello " .. (player:getSex() == 0 and "beautiful lady" or "handsome gentleman") .. ", welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "287") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 16 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 17)
			npcHandler:say("Sure, you can get it from me. Here you are. Bye", cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")
npcHandler:addModule(FocusModule:new())
