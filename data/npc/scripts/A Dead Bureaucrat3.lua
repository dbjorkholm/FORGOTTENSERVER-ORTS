local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Hello " .. (Player(cid):getSex() == 0 and "beautiful lady" or "handsome gentleman") .. ", welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local vocationId = getBaseVocation(player:getVocation():getId())

	if msgcontains(msg, "pumin") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 8 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 9)
			npcHandler:say("Tell me if you liked it when you come back. What is your name?", cid)
		end
	elseif msgcontains(msg, player:getName()) then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 9 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 10)
			npcHandler:say("Alright " .. player:getName() ..". Vocation?", cid)
		end
	elseif msgcontains(msg, Vocation(vocationId):getName()) then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 10 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 11)
			npcHandler:say("I was a " .. Vocation(vocationId):getName() .. ", too, before I died!! What do you want from me?", cid)
		end
	elseif msgcontains(msg, "145") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 11 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 12)
			npcHandler:say("That's right, you can get Form 145 from me. However, I need Form 411 first. Come back when you have it.", cid)
		elseif player:getStorageValue(Storage.pitsOfInferno.Pumin) == 21 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 22)
			npcHandler:say("Well done! You have form 411!! Here is Form 145. Have fun with it.", cid)
		end
	elseif msgcontains(msg, "hi") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 20 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 21)
			npcHandler:say("Back again? How can I help you this time?", cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")
npcHandler:addModule(FocusModule:new())
