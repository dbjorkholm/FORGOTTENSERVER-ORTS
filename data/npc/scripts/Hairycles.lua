
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function getTable(player)
local itemsList = {
		{name="Banana", id=2676, buy=2},
		}
local statues = {	
		{{name="Monkey Statue (No Seeing)", id=5086, buy=65},
		{name="Monkey Statue (No Hearing)", id=5087, buy=65},
		{name="Monkey Statue (No Speaking)", id=5088, buy=65}}
		}

if player:getStorageValue(Storage.TheApeCity.Questline) >= 23 then
	for i = 1, #statues[1] do
		table.insert(itemsList, statues[1][i])
	end
end
return itemsList
end

function greetCallback(cid)
	local player = Player(cid)
	if(player:getStorageValue(Storage.TheApeCity.Questline) <= 14) then
		npcHandler:setMessage(MESSAGE_GREET, "Oh! Hello! Hello! Did not notice!")
	elseif(player:getStorageValue(Storage.TheApeCity.Questline) >= 15) then
		npcHandler:setMessage(MESSAGE_GREET, "Be greeted, friend of the ape people. If you want to trade, just ask for my offers. If you are injured, ask for healing.")
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	
	elseif msgcontains(msg, "heal") then
		if player:getStorageValue(Storage.TheApeCity.Mission06) >= 3 then
			local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED}
			if player:getHealth() < 50 then
				player:addHealth(50 - player:getHealth())
				for i = 1, #conditions do
					if player:getCondition(conditions[i], CONDITIONID_COMBAT) then
						player:removeCondition(conditions[i], CONDITIONID_COMBAT)
					end
				end
				npcHandler:say("You are hurt. I will heal your wounds.", cid)
			else
				npcHandler:say("You aren't looking that bad. Sorry, I can't help you.", cid)
			end
		else
			npcHandler:say("I only heal friends of ape...", cid)
		end

	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.TheApeCity.Questline) < 1 then
			npcHandler:say("These are dire times for our people. Problems plenty are in this times. But me people not grant trust easy. Are you willing to prove you friend of ape people?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 1 then
			npcHandler:say("Oh, you brought me whisper moss? Good hairless ape you are! Can me take it?", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 2 then
			npcHandler:say({"Whisper moss strong is, but me need liquid that humans have to make it work ...",
							"Our raiders brought it from human settlement, it's called cough syrup. Go ask healer there for it."}, cid, 0, 1, 3000)
			player:setStorageValue(Storage.TheApeCity.Questline, 3)
			player:setStorageValue(Storage.TheApeCity.Mission02, 1) -- The Ape City Questlog - Mission 2: The Cure
		elseif player:getStorageValue(Storage.TheApeCity.Questline) >= 3 and player:getStorageValue(Storage.TheApeCity.Questline) <= 6 then
			npcHandler:say("You brought me that cough syrup from human healer me asked for?", cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 7 then
			npcHandler:say("Little ape should be healthy soon. Me so happy is. Thank you again! But me suspect we in more trouble than we thought. Will you help us again?", cid)
			npcHandler.topic[cid] = 5
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 8 then
			npcHandler:say("You got scroll from lizard village in south east?", cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 9 then
			npcHandler:say({"Ah yes that scroll. Sadly me not could read it yet. But the holy banana me insight gave! In dreams Hairycles saw where to find solution ...",
							"Me saw a stone with lizard signs and other signs at once. If you read signs and tell Hairycles, me will know how to read signs ...",
							"You go east to big desert. In desert there city. East of city under sand hidden tomb is. You will have to dig until you find it, so take shovel ...",
							"Go down in tomb until come to big level and then go down another. There you find a stone with signs between two huge red stones ...",
							"Read it and return to me. Are you up to that challenge?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 8
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 10 then
			npcHandler:say("Ah yes, you read the signs in tomb? Good! May me look into your mind to see what you saw?", cid)
			npcHandler.topic[cid] = 9
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 11 then
			npcHandler:say({"So much there is to do for Hairycles to prepare charm that will protect all ape people ...",
							"You can help more. To create charm of life me need mighty token of life! Best is egg of a regenerating beast as a hydra is ...",
							"Bring me egg of hydra please. You may fight it in lair of Hydra at little lake south east of our lovely city Banuta! You think you can do?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 10
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 12 then
			npcHandler:say("You bring Hairycles egg of hydra?", cid)
			npcHandler.topic[cid] = 11
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 13 then
			npcHandler:say({"Last ingredient for charm of life is thing to lure magic. Only thing me know like that is mushroom called witches cap. Me was told it be found in isle called Fibula, where humans live ...",
							"Hidden under Fibula is a secret dungeon. There you will find witches cap. Are you willing to go there for good ape people?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 12
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 14 then
			npcHandler:say("You brought Hairycles witches cap from Fibula?", cid)
			npcHandler.topic[cid] = 13
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 15 then
			npcHandler:say({"Mighty life charm is protecting us now! But my people are still in danger. Danger from within ...",
							"Some of my people try to mimic lizards to become strong. Like lizards did before, this cult drinks strange fluid that lizardsleft when fled ...",
							"Under the city still the underground temple of lizards is. There you find casks with red fluid. Take crowbar and destroy three of them to stop this madness. Are you willing to do that?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 14
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 16 then
			npcHandler:say("Your mission is to take crowbar and destroy three of them casks to stop this madness.", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 17 then
			npcHandler:say("You do please Hairycles again, friend. Me hope madness will not spread further now. Perhaps you are ready for other {mission}.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 18)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 18 then
			npcHandler:say({"Now that the false cult was stopped, we need to strengthen the spirit of my people. We need a symbol of our faith that apepeople can see and touch ...",
							"Since you have proven a friend of the ape people I will grant you permission to enter the forbidden land ...",
							"To enter the forbidden land in the north-east of the jungle, look for a cave in the mountains east of it. There you will find theblind prophet ...",
							"Tell him Hairycles you sent and he will grant you entrance ...",
							"Forbidden land is home of Bong. Holy giant ape big as mountain. Don't annoy him in any way but look for a hair of holy ape ...",
							"You might find at places he has been, should be easy to see them since Bong is big ...",
							"Return a hair of the holy ape to me. Will you do this for Hairycles?"}, cid, 0, 1, 3000)
			npcHandler.topic[cid] = 15
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 19 then
			npcHandler:say("You brought hair of holy ape?", cid)
			npcHandler.topic[cid] = 16
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 20 then
			npcHandler:say({"You have proven yourself a friend, me will grant you permission to enter the deepest catacombs under Banuta which we havesealed in the past ...",
							"Me still can sense the evil presence there. We did not dare to go deeper and fight creatures of evil there ...",
							"You may go there, fight the evil and find the monument of the serpent god and destroy it with hammer me give to you ...",
							"Only then my people will be safe. Please tell Hairycles, will you go there?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 17
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 21 then
			npcHandler:say("Your mission is to destroy the Cobra Statue in deep Banuta.", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.TheApeCity.Questline) == 22 then
			npcHandler:say({"Finally my people are safe! You have done incredible good for ape people and one day even me brethren will recognise that ...",
							"I wish I could speak for all when me call you true friend but my people need time to get accustomed to change ...",
							"Let us hope one day whole Banuta will greet you as a friend. Perhaps you want to check me offers for special friends... or {shamanic powers}."}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 18
		else
			npcHandler:say("I have now no mission for you!", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "shamanic powers") then
		if npcHandler.topic[cid] == 18 then	
			npcHandler:say("Me truly proud of you, friend. You learn many about plants, charms and ape people. Me want grant you shamanic power now. You ready?", cid)
			npcHandler.topic[cid] = 19
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say("To become friend of ape people a long and difficult way is. We do not trust easy but help is needed. Will you listen to story of Hairycles?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then	
			npcHandler:say({"So listen, little ape was struck by plague. Hairycles not does know what plague it is. That is strange. Hairycles should know. But Hairycles learnt lots and lots ...",
							"Me sure to make cure so strong to drive away all plague. But to create great cure me need powerful components ...",
							"Me need whisper moss. Whisper moss growing south of human settlement is. Problem is, evil little dworcs harvest all whisper moss immediately ...",
							"Me know they hoard some in their underground lair. My people raided dworcs often before humans came. So we know the moss is hidden in east of upper level of dworc lair ...",
							"You go there and take good moss from evil dworcs. Talk with me about mission when having moss."}, cid, 0, 1, 4000)
			player:setStorageValue(Storage.TheApeCity.Questline, 1)
			player:setStorageValue(Storage.TheApeCity.Mission01, 1) -- The Ape City Questlog - Mission 1: Whisper Moss
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(4838) >= 1 then
				player:removeItem(4838, 1)
				npcHandler:say("Ah yes! That's it. Thank you for bringing mighty whisper moss to Hairycles. It will help but still much is to be done. Just ask for other {mission} if you ready.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 2)
				player:setStorageValue(Storage.TheApeCity.Mission01, 2) -- The Ape City Questlog - Mission 1: Whisper Moss
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(4839) >= 1 then
				player:removeItem(4839, 1)
				npcHandler:say("You so good! Brought syrup to me! Thank you, will prepare cure now. Just ask for {mission} if you want help again.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 7)
				player:setStorageValue(Storage.TheApeCity.Mission02, 5) -- The Ape City Questlog - Mission 2: The Cure
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then	
			npcHandler:say({"So listen, please. Plague was not ordinary plague. That's why Hairycles could not heal at first. It is new curse of evil lizard people ...",
							"I think curse on little one was only a try. We have to be prepared for big strike ...",
							"Me need papers of lizard magician! For sure you find it in his hut in their dwelling. It's south east of jungle. Go look there please! Are you willing to go?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 6
		elseif npcHandler.topic[cid] == 6 then	
			npcHandler:say("Good thing that is! Report about your mission when have scroll.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 8)
			player:setStorageValue(Storage.TheApeCity.Mission03, 1) -- The Ape City Questlog - Mission 3: Lizard Parchment
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount(5956) >= 1 then
				player:removeItem(5956, 1)
				npcHandler:say("You brought scroll with lizard text? Good! I will see what text tells me! Come back when ready for other {mission}.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 9)
				player:setStorageValue(Storage.TheApeCity.Mission03, 2) -- The Ape City Questlog - Mission 3: Lizard Parchment
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 8 then	
			npcHandler:say("Good thing that is! Report about mission when you have read those signs.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 10)
			player:setStorageValue(Storage.Storage.TheApeCity.Mission04, 1) -- The Ape City Questlog - Mission 4: Parchment Decyphering
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 9 then
			if player:getStorageValue(Storage.Storage.TheApeCity.Mission04) == 2 then
				npcHandler:say("Oh, so clear is all now! Easy it will be to read the signs now! Soon we will know what to do! Thank you again! Ask for {mission} if you feel ready.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 11)
				player:setStorageValue(Storage.Storage.TheApeCity.Mission04, 3) -- The Ape City Questlog - Mission 4: Parchment Decyphering
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 10 then	
			npcHandler:say("You brave hairless ape! Get me hydra egg. If you lose egg, you probably have to fight many, many hydras to get another.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 12)
			player:setStorageValue(Storage.TheApeCity.Mission05, 1) -- The Ape City Questlog - Mission 5: Hydra Egg
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then
			if player:getItemCount(4850) >= 1 then
				player:removeItem(4850, 1)
				npcHandler:say("Ah, the egg! Mighty warrior you be! Thank you. Hairycles will put it at safe place immediately.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 13)
				player:setStorageValue(Storage.TheApeCity.Mission05, 3) -- The Ape City Questlog - Mission 5: Hydra Egg
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 12 then	
			npcHandler:say("Long journey it will take, good luck to you.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 14)
			player:setStorageValue(Storage.TheApeCity.Mission06, 1) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 13 then
			if player:getItemCount(4840) >= 1 then
				player:removeItem(4840, 1)
				npcHandler:say("Incredible, you brought a witches cap! Now me can prepare mighty charm of life. Yet still other missions will await you,friend.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 15)
				player:setStorageValue(Storage.TheApeCity.Mission06, 3) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 14 then	
			npcHandler:say("Hairycles sure you will make it. Good luck, friend.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 16)
			player:setStorageValue(Storage.TheApeCity.Mission07, 1) -- The Ape City Questlog - Mission 7: Destroying Casks With Crowbar
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 15 then	
			npcHandler:say("Hairycles proud of you. Go and find holy hair. Good luck, friend.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 19)
			player:setStorageValue(Storage.TheApeCity.Mission08, 1) -- The Ape City Questlog - Mission 8: Looking for a hair of holy ape
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 16 then
			if player:getItemCount(4843) >= 1 then
				player:removeItem(4843, 1)
				npcHandler:say("Incredible! You got a hair of holy Bong! This will raise the spirit of my people. You are truly a friend. But one last mission awaits you.", cid)
				player:setStorageValue(Storage.TheApeCity.Questline, 20)
				player:setStorageValue(Storage.TheApeCity.Mission08, 3) -- The Ape City Questlog - Mission 8: Looking for a hair of holy ape
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 17 then	
			player:addItem(4846, 1)
			npcHandler:say("Hairycles sure you will make it. Just use hammer on all that looks like snake or lizard. Tell Hairycles if you succeed with mission.", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 21)
			player:setStorageValue(Storage.TheApeCity.Mission09, 1) -- The Ape City Questlog - Mission 9: The Deepest Catacombs
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 19 then	
			player:addOutfit(158, 0)
			player:addOutfit(154, 0)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say("Friend of the ape people! Take my gift and become me apprentice! Here is shaman clothing for you!", cid)
			player:setStorageValue(Storage.TheApeCity.Questline, 23)
			player:setStorageValue(Storage.TheApeCity.Mission09, 3) -- The Ape City Questlog - Mission 9: The Deepest Catacombs
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "trade") then
		if player:getStorageValue(Storage.TheApeCity.Mission06) >= 3 then
			local player = Player(cid)
			local items = setNewTradeTable(getTable(player))
			local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
				if (ignoreCap == false and (player:getFreeCapacity() < getItemWeight(items[item].itemId, amount) or inBackpacks and player:getFreeCapacity() < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
					return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
				end
				if items[item].buyPrice <= player:getMoney() then
					if inBackpacks then
						local container = Game.createItem(1988, 1)
						local bp = player:addItemEx(container)
						if(bp ~= 1) then
							return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')	
						end
						for i = 1, amount do
							container:addItem(items[item].itemId, items[item])
						end
					else
						return 
						player:addItem(items[item].itemId, amount, false, items[item]) and
						player:removeMoney(amount * items[item].buyPrice) and
						player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
					end
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
					player:removeMoney(amount * items[item].buyPrice)
				else
					player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You do not have enough money.')
				end
				return true
			end
				
			local function onSell(cid, item, subType, amount, ignoreEquipped)
				if items[item].sellPrice then
					return
					player:removeItem(items[item].itemId, amount, -1, ignoreEquipped) and
					player:addMoney(items[item].sellPrice * amount) and
			
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
				end
				return true
			end
				openShopWindow(cid, getTable(player), onBuy, onSell)
				
				npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
		else
			npcHandler:say("I only trade with friends of ape...", cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())