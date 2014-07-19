local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Hum hum, huhum',
	'Silly lil\' human'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 10)
		if(math.random(100) < 20) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local player = Player(cid)
	if (msgcontains(msg, "melt")) then
		npcHandler:say("Can melt gold ingot for lil' one. You want?", cid)
		npcHandler.topic[cid] = 10
	elseif (msgcontains(msg, "yes") and npcHandler.topic[cid] == 10) then
		if player:removeItem(9971,1) then
			npcHandler:say("whoooosh There!", cid)
			player:addItem(13941, 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("There is no gold ingot with you.", cid)	
			npcHandler.topic[cid] = 0
		end
	end

	if(msgcontains(msg, "amulet")) then
		if(player:getStorageValue(49) < 1) then
			npcHandler:say("Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil' time to make it unbroken. Yes or no??", cid)
			npcHandler.topic[cid] = 9
		elseif(player:getStorageValue(49) == 1) then
			if(player:getStorageValue(48) + 24 * 60 * 60 < os.time()) then
				npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
				npcHandler.topic[cid] = 0
				player:addItem(8266, 1)
				player:setStorageValue(49, 2)
			else
				npcHandler:say("Me need more time!!!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Wait. Me work no cheap is. Do favour for me first, yes?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Me need gift for woman. We dance, so me want to give her bast skirt. But she big is. So I need many to make big one. Bring three okay? Me wait.", cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.FriendsandTraders.DefaultStart, 1)
			player:setStorageValue(Storage.FriendsandTraders.TheSweatyCyclops, 1)
		elseif(npcHandler.topic[cid] == 3) then
			if(player:getItemCount(3983) >= 3) then
				player:removeItem(3983, 3)
				npcHandler:say("Good good! Woman happy will be. Now me happy too and help you.", cid)
				npcHandler.topic[cid] = 0
				player:setStorageValue(Storage.FriendsandTraders.TheSweatyCyclops, 2)
			end
		-- Crown Armor
		elseif(npcHandler.topic[cid] == 4) then
			if(player:getItemCount(2487) >= 1) then
				player:removeItem(2487, 1)
				npcHandler:say("Cling clang! ", cid)
				npcHandler.topic[cid] = 0
				player:addItem(5887, 1)
			end	
		-- Dragon Shield
		elseif(npcHandler.topic[cid] == 5) then
			if(player:getItemCount(2516) >= 1) then
				player:removeItem(2516, 1)
				npcHandler:say("Cling clang! ", cid)
				npcHandler.topic[cid] = 0
				player:addItem(5889, 1)
			end	
		-- Devil Helmet	
		elseif(npcHandler.topic[cid] == 6) then
			if(player:getItemCount(2462) >= 1) then
				player:removeItem(2462, 1)
				npcHandler:say("Cling clang! ", cid)
				npcHandler.topic[cid] = 0
				player:addItem(5888, 1)
			end	
		-- Giant Sword	
		elseif(npcHandler.topic[cid] == 7) then
			if(player:getItemCount(2393) >= 1) then
				player:removeItem(2393, 1)
				npcHandler:say("Cling clang! ", cid)
				npcHandler.topic[cid] = 0
				player:addItem(5892, 1)
			end	
		-- Soul Orb
		elseif(npcHandler.topic[cid] == 8) then
			if(player:getItemCount(5944) >= 1) then
				local count = player:getItemCount(5944)
				for i = 1, count do
					if math.random(100) <= 1 then
						player:addItem(6529, 6)
						player:removeItem(5944, 1)
					else
						player:addItem(6529, 3)
						player:removeItem(5944, 1)
					end
				end
				npcHandler:say("Cling clang! ", cid)
				npcHandler.topic[cid] = 0
			end	
		elseif(npcHandler.topic[cid] == 9) then
			if(player:getItemCount(8262) >= 1 and player:getItemCount(8263) >= 1 and player:getItemCount(8264) >= 1 and player:getItemCount(8265) >= 1 and player:getMoney() >= 5000) then
				player:removeItem(8262, 1)
				player:removeItem(8263, 1)
				player:removeItem(8264, 1)
				player:removeItem(8265, 1)
				player:removeMoney(5000)
				player:setStorageValue(48, os.time())
				player:setStorageValue(49, 1)
				npcHandler:say("Well, well, I do that! Big Ben makes lil' amulet unbroken with big hammer in big hands! No worry! Come back after sun hits the horizon 24 times and ask me for amulet.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 11 then
			if player:getItemCount(5880) >= 1 then
				player:setStorageValue(Storage.hiddenCityOfBeregar.GearWheel, player:getStorageValue(Storage.hiddenCityOfBeregar.GearWheel) + 1)
				player:removeItem(5880, 1)
				player:addItem(9690, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Lil' one does not have any iron ores.", cid)
				npcHandler.topic[cid] = 0
			end
		end

	-- Crown Armor
	elseif(msg == "uth'kean") then
		if(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) < 1) then
			npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			npcHandler.topic[cid] = 3
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 2) then
			npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 4
		end
	-- Dragon Shield
	elseif(msg == "uth'lokr") then
		if(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) < 1) then
			npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			npcHandler.topic[cid] = 3
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 2) then
			npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 5
		end
	-- Devil Helmet
	elseif(msg == "za'ralator") then
		if(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) < 1) then
			npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			npcHandler.topic[cid] = 3
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 2) then
			npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 6
		end
	-- Giant Sword
	elseif(msg == "uth'prta") then
		if(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) < 1) then
			npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			npcHandler.topic[cid] = 3
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 2) then
			npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 7
		end
	-- Soul Orb
	elseif(msgcontains(msg, "soul orb")) then
		if(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) < 1) then
			npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			npcHandler.topic[cid] = 3
		elseif(player:getStorageValue(Storage.FriendsandTraders.TheSweatyCyclops) == 2) then
			npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif msgcontains(msg, "gear wheel") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.GoingDown) >= 1 and player:getStorageValue(Storage.hiddenCityOfBeregar.GearWheel) > 3 then
			npcHandler:say("Uh. Me can make some gear wheel from iron ores. Lil' one want to trade?", cid)
			npcHandler.topic[cid] = 11
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am smith."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Working steel is my profession."})
keywordHandler:addKeyword({'steel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Manny kinds of. Like {Mesh Kaha Rogh'}, {Za'Kalortith}, {Uth'Byth}, {Uth'Morc}, {Uth'Amon}, {Uth'Maer}, {Uth'Doon}, and {Zatragil}."})
keywordHandler:addKeyword({'zatragil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most ancients use dream silver for different stuff. Now ancients most gone. Most not know about."})
keywordHandler:addKeyword({'uth\'doon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's high steel called. Only lil' lil' ones know how make."})
keywordHandler:addKeyword({'za\'kalortith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's evil. Demon iron is. No good cyclops goes where you can find and need evil flame to melt."})
keywordHandler:addKeyword({'mesh kaha rogh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Steel that is singing when forged. No one knows where find today."})
keywordHandler:addKeyword({'uth\'byth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not good to make stuff off. Bad steel it is. But eating magic, so useful is."})
keywordHandler:addKeyword({'uth\'maer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brightsteel is. Much art made with it. Sorcerers too lazy and afraid to enchant much."})
keywordHandler:addKeyword({'uth\'amon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heartiron from heart of big old mountain, found very deep. Lil' lil ones fiercely defend. Not wanting to have it used for stuff but holy stuff."})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me parents live here before town was. Me not care about lil' ones."})
keywordHandler:addKeyword({'lil\' lil\''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I'll go and look."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their business."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their business."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I called Bencthyclthrtrprr by me people. Lil' ones me call Big Ben."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You shut up. Me not want to hear."})
keywordHandler:addKeyword({'fire sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do lil' one want to trade a fire sword?"})
keywordHandler:addKeyword({'dragon shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do lil' one want to trade a dragon shield?"})
keywordHandler:addKeyword({'sword of valor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do lil' one want to trade a sword of valor?"})
keywordHandler:addKeyword({'warlord sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do lil' one want to trade a warlord sword?"})
keywordHandler:addKeyword({'minotaurs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me not fight them, they not fight me."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me wish I could make weapon like it."})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me people not live here much. Most are far away."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hum Humm! Welcume lil' |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye lil' one.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye lil' one.")
npcHandler:addModule(FocusModule:new())
