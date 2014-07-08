local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 5)
		if(math.random(100) < 25) then
			Npc():say("Quality armors for sale!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling leather armor, chain armor, and brass armor. Ask me for a {trade} if you like to take a look."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I run this armoury. If you want to protect your life, you better buy my wares."})


local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"adorn", "armour"}, msg) then
		if player:getStorageValue(Storage.OutfitQuest.WarriorShoulderAddon) == 5 then
			player:addOutfitAddon(142, 1)
			player:addOutfitAddon(134, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:setStorageValue(Storage.OutfitQuest.WarriorShoulderAddon, 6)
			npcHandler:say({"Ah, you must be the hero Trisha talked about. I'll prepare the shoulder spikes for you.", " Finished! Since you are a man, I thought you probably wanted two. Men always want that little extra status symbol. <giggles>"}, cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to the finest {armor} shop in the land, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Come back soon.")
npcHandler:addModule(FocusModule:new())
