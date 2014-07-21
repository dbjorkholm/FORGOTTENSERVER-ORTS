local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.ultimateBooze.Quest) < 1 then
			npcHandler:say("Shush!! I don't want everybody to know what I am up to. Listen, things are not going too well, I need a new attraction. Do you want to help me?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.ultimateBooze.Quest) == 1 and player:getItemCount(7495) then
			player:removeItem(7495, 1)
			player:setStorageValue(Storage.ultimateBooze.Quest, 2)
			npcHandler:say("Yessss! Now I only need to build my own small brewery, figure out the secret recipe, duplicate the dwarvish brew and BANG I'll be back in business! Here take this as a reward.", cid)
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(Storage.ultimateBooze.Quest, 1)
			npcHandler:say("Good! Listen closely. Take this bottle and go to Kazordoon. I need a sample of their very special brown ale. You may find a cask in their brewery. Come back as soon as you got it.", cid)
			player:addItem(7496, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			if player:getMoney() >= 3000 then
				player:setStorageValue(Storage.hiddenCityOfBeregar.TheGoodGuard, 2)
				player:removeMoney(3000)
				player:addItem(9689, 1)
				npcHandler:say("Here it is. Have fun with this delicious brew.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "dwarven brown ale") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.TheGoodGuard) == 1 then
			npcHandler:say("You are soooo lucky. Only recently I finished my first cask. As this would never have been possible without you, I make you a special offer. 3000 Gold! Alright?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "You'll be back.")
npcHandler:setMessage(MESSAGE_FAREWELL, "You'll be back.")
npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Hard Rock Racing Track, " ..Player(cid):getName() .. ".")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
