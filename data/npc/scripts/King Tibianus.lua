local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'eremo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that he lives on a small island near Edron. Maybe the people there know more about him."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am your sovereign, King Tibianus III, and it's my duty to uphold {justice} and provide guidance for my subjects."})
keywordHandler:addKeyword({'justice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I try my best to be just and fair to our citizens. The army and the {TBI} are a great help in fulfilling this duty."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Preposterous! You must know the name of your own King!"})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The latest news is usually brought to our magnificent town by brave adventurers. They recount tales of their journeys at Frodo's tavern."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thank you, I'm fine."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rain Castle is my home."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sell? Sell what? My kingdom isn't for sale!"})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Honour the Gods and above all pay your {taxes}."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please ask a priest about the gods."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The citizens of Tibia are my subjects. Ask the old monk Quentin if you want to learn more about them."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a skilled blacksmith and a loyal subject."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the owner of Frodo's Hut and a faithful tax-payer."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He was once one of Tibia's greatest fighters. Now he sells equipment."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He was once my greatest general. Now he is very old and senile so we assigned him to work for the Royal Tibia Mail."})
keywordHandler:addKeyword({'noodles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The royal poodle Noodles is my greatest {treasure}!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a follower of the evil God Zathroth and responsible for many attacks on us. Kill him on sight!"})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is my royal jester and cheers me up now and then."})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The royal poodle Noodles is my greatest treasure!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Go and hunt them! For king and country!"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Quentin the monk for help."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What a disgusting topic!"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dungeons are no places for kings."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Feel free to buy it in our town's fine shops."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the royal cook for some food."})
keywordHandler:addKeyword({'tax collector'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That tax collector is the bane of my life. He is so lazy. I bet you haven't payed any taxes at all."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the king, so watch what you say!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the soldiers about that."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit the shops of our merchants and craftsmen."})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four major guilds are the knights, the paladins, the druids, and the sorcerers."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Vile monsters, but I must admit they are strong and sometimes even cunning ... in their own bestial way."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The forces of good are hard pressed in these dark times."})
keywordHandler:addKeyword({'evil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We need all strength we can muster to smite evil!"})
keywordHandler:addKeyword({'order'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We need order to survive!"})
keywordHandler:addKeyword({'chaos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Chaos arises from selfishness."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's the sword of the Kings. If you return this weapon to me I will {reward} you beyond your wildest dreams."})
keywordHandler:addKeyword({'reward'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, if you want a reward, go on a quest to bring me Excalibug!"})
keywordHandler:addKeyword({'chester'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A very competent person. A little nervous but very competent."})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This organisation is an essential tool for holding our enemies in check. Its headquarter is located in the bastion in the northwall."})

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if msgcontains(msg, "hail") or msgcontains(msg, "salutations") or msgcontains(msg, "king") and not npcHandler:isFocused(cid) then
		npcHandler:say('I greet thee, my loyal subject ' .. player:getName() .. '.', cid)
		npcHandler:addFocus(cid)
		npcHandler.topic[cid] = 0
		return true
	end
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray({"tibia", "land"}, msg) then
		npcHandler:say("Soon the whole land will be ruled by me once again!", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"harkath", "bloodblade", "general"}, msg) then
		npcHandler:say("Harkath Bloodblade is the general of our glorious {army}.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"quest", "mission"}, msg) then
		npcHandler:say("I will call for heroes as soon as the need arises again and then reward them appropriately.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"gold", "money", "tax", "collector"}, msg) then
		npcHandler:say("To pay your taxes, visit the royal tax collector.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"time", "hero", "adventurer"}, msg) then
		npcHandler:say("It's a time for heroes!", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"enemy", "enemies"}, msg) then
		npcHandler:say("Our enemies are numerous. The evil minotaurs, Ferumbras, and the renegade city of Carlin to the north are just some of them.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"city", "north", "carlin"}, msg) then
		npcHandler:say("They dare to reject my reign over the whole continent!", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"thais", "city"}, msg) then
		npcHandler:say("Our beloved city has some fine shops, guildhouses and a modern sewerage system.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"merchant", "craftsmen"}, msg) then
		npcHandler:say("Ask around about them.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"paladin", "elane"}, msg) then
		npcHandler:say("The paladins are great protectors for Thais.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"knight", "gregor"}, msg) then
		npcHandler:say("The brave knights are necessary for human survival in Thais.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"sorcerer", "muriel"}, msg) then
		npcHandler:say("The magic of the sorcerers is a powerful tool to smite our enemies.", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"druid", "marvik"}, msg) then
		npcHandler:say("We need the druidic healing powers to fight evil.", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "promot") then
		npcHandler:say("Do you want to be promoted in your vocation for 20000 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(30018) == 1 then
			npcHandler:say('You are already promoted.', cid)
		elseif player:getLevel() < 20 then
			npcHandler:say('You need to be at least level 20 in order to be promoted.', cid)
		elseif player:getMoney() < 20000 then
			npcHandler:say('You do not have enough money.', cid)
		elseif player:isPremium() then
			npcHandler:say("Congratulations! You are now promoted.", cid)
			local promotedVoc = getPromotedVocation(player:getVocation():getId())
			player:setVocation(Vocation(promotedVoc))
			player:removeMoney(20000)
		else
			npcHandler:say("You need a premium account in order to promote.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 1 then
		npcHandler:say("Ok, whatever.", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "fan club membership") and player:getStorageValue(100000) == 15 and player:removeItem(10308, 1) then
		npcHandler:say({"Ah, {A fan club premium membership card}! You must be that intelligent fellow who wrote me all those flattering letters! Nice to finally meet my greatest admirer in person. Here, take this little token of appreciation. ...",
						"And now if you will excuse me, I have to attend urgent affairs of state."}, cid)
		player:setStorageValue(100000, 16)
		player:addItem(10306,1)
		player:setStorageValue(100063, 24)
		player:setStorageValue(100162, 9)
	end
	--The New Frontier
	if msgcontains(msg, "farmine") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 15 then
			npcHandler:say("Ah, I vaguely remember that our little allies were eager to build some base. So speak up, what do you want?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "flatter") then
		if npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.TheNewFrontier.BribeKing) ~= 1 then
				npcHandler:say("Indeed, indeed. Without the help of Thais, our allies stand no chance! Well, I'll send some money to support their cause.", cid)
				player:setStorageValue(Storage.TheNewFrontier.BribeKing, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
