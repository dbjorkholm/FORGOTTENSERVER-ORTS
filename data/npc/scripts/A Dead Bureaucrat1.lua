local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local sex = {
	[beautiful lady] = player:getSex(PLAYERSEX_FEMALE),
	[handsome gentleman] = player:getSex(PLAYERSEX_MALE)
}

local vocation = {
	[sorcerer] = "wand",
	[knight] = "sword",
	[druid] = "rod",
	[paladin] = "bow"
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "pumin") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) <= 1 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 1)
			npcHandler:say("Sure, where else. Everyone likes to meet my master, he is a great demon, isn't he? Your name is ...?", cid)
		end
	elseif msgcontains(msg, .. player:getName() ..) then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 1 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 2)
			npcHandler:say("Alright" .. player:getName() ..". Vocation?", cid)
		end
	elseif msgcontains(msg, .. player:getVocation() ..) then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 2 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 3)
			npcHandler:say("Huhu, please don't hurt me with your" .. player:getVocation() = vocation.[vocation] .. "! Reason of your visit?", cid)
		end
	elseif msgcontains(msg, "visit pumin") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 3 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 4)
			npcHandler:say("How very interesting. I need to tell that to my master immediately. Please go to my colleagues and ask for Form 356. You will need it in order to proceed.", cid)
		end
	elseif msgcontains(msg, "hi") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 12 then 
			player:setStorageValue(Storage.pitsOInferno.Pumin, 13)
			npcHandler:say("You again. I told my master that you wish to end your stupid life in his domain but you need Form 356 to get there. What do you need this time?", cid)
		elseif player:getStorageValue(Storage.pitsOfInferno.Pumin) == 17 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 18)
			npcHandler:say("You again. I told my master that you wish to end your stupid life in his domain but you need Form 356 to get there. What do you need this time?", cid)
		elseif player:getStorageValue(Storage.pitsOfInferno.Pumin) == 24 then
			player:setStorageValue(Storage.pitsOfInferno.Pumin, 25)
			npcHandler:say("You again. I told my master that you wish to end your stupid life in his domain but you need Form 356 to get there. What do you need this time?", cid)
		end
	elseif msgcontains(msg, "411") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 13 then
			player:setStorageValue(Storage.pitsOInferno.Pumin, 14)
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", cid)
		elseif player:getStorageValue(Storage.pitsOfInferno.Pumin) == 18 then
			player:setStorageValue(Storage.pitsOInferno.Pumin, 19)
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", cid)
		end
	elseif msgcontains(msg, "no") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 14 then
			player:setStorageValue(Storage.pitsOInferno.Pumin, 15)
			npcHandler:say("Oh, what a pity. Go see one of my colleagues. I give you the permission to get Form 287. Bye!", cid)
		end
	elseif msgcontains(msg, "yes") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 19 then
			player:setStorageValue(Storage.pitsOInferno.Pumin, 20)
			npcHandler:say("Great. Here you are. Form 411. Come back anytime you want to talk. Bye.", cid)
		end
	elseif msgcontains(msg, "356") then
		if player:getStorageValue(Storage.pitsOfInferno.Pumin) == 25 then
			player:setStorageValue(Storage.pitsOInferno.Pumin, 26)
			npcHandler:say("INCREDIBLE, you did it!! Have fun at Pumin's Domain!", cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello beautiful".. player:getSex() .. ", welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")
npcHandler:addModule(FocusModule:new())
