local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	npcHandler:onThink()					
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local player = Player(cid)
	if msgcontains(msg, "mission") then
		if player:getStorageValue(12001) == 5 then
			npcHandler:say("I heard you have already helped our cause. Are you interested in another mission, even when it requires you to travel to a distant land?", player)
			talkState[talkUser] = 1
		elseif player:getStorageValue(12001) == 7 then
			npcHandler:say("Well done. The termites caused just the distraction that we needed. Are you ready for the next step of my plan?", player)
			talkState[talkUser] = 3
		elseif player:getStorageValue(12001) == 9 then
			npcHandler:say("You saved the lives of many innocent animals. Thank you very much. If you are looking for another mission, just ask me.", player)
			player:setStorageValue(12001, 10)
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 10 then
			npcHandler:say("Our warriors need a more potent yet more secure berserker elixir to fight our enemies. To brew it, I need several ingredients. The first things needed are 5 bat wings. Bring them to me and Ill tell you the next ingredients we need.", player)
			player:setStorageValue(12001, 11)
			player:setStorageValue(12029, 1) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 11 then
			npcHandler:say("Do you have the 5 bat wings I requested?", player)
			talkState[talkUser] = 5
		elseif player:getStorageValue(12001) == 12 then
			npcHandler:say("The second things needed are 4 bear paws. Bring them to me and Ill tell you the next ingredients we need.", player)
			player:setStorageValue(12001, 13)
			player:setStorageValue(12029, 2) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 13 then
			npcHandler:say("Do you have the 4 bear paws I requested?", player)
			talkState[talkUser] = 6
		elseif player:getStorageValue(12001) == 14 then
			npcHandler:say("The next things needed are 3 bonelord eyes. Bring them to me and Ill tell you the next ingredients we need.", player)
			player:setStorageValue(12001, 15)
			player:setStorageValue(12029, 3) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 15 then
			npcHandler:say("Do you have the 3 bonelord eyes I requested?", player)
			talkState[talkUser] = 7 
		elseif player:getStorageValue(12001) == 16 then
			npcHandler:say("The next things needed are 2 fish fins. Bring them to me and Ill tell you the next ingredients we need.", player)
			player:setStorageValue(12001, 17)
			player:setStorageValue(12029, 4) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 17 then
			npcHandler:say("Do you have the 2 fish fins I requested?", player)
			talkState[talkUser] = 8
		elseif player:getStorageValue(12001) == 18 then
			npcHandler:say("The last thing needed is a green dragon scale. Bring them to me and Ill tell you the next ingredients we need.", player)
			player:setStorageValue(12001, 19)
			player:setStorageValue(12029, 5) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 19 then
			npcHandler:say("Do you have the green dragon scale I requested?", player)
			talkState[talkUser] = 9
		else 
		npcHandler:say("I have now no mission for you.", player)
		talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "jug") then
		npcHandler:say("Do you want to buy a jug for 1000 gold?", player)
		talkState[talkUser] = 2
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then
			npcHandler:say({"I am pleased to hear that. On the isle of Tyrsung foreign hunters have set up camp. They are hunting the animals there with no mercy. We will haveto find something that distracts them from hunting ...",
							"Take this jug here and travel to the jungle of Tiquanda. There you will find a race of wood eating ants called termites. Use the jug on one of their hills to catch some of them ...",
							"Then find someone in Svargrond that brings you to Tyrsung. There, release the termites on the bottom of a mast in the hull of the hunters' ship. If you are done, report to me about your mission."}, player, 0, 1, 4000)
			player:setStorageValue(12001, 6)
			player:setStorageValue(12027, 1) -- Questlog The Ice Islands Quest, Nibelor 2: Ecological Terrorism
			player:addItem(7243, 1)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 2 then
			if player:getMoney() >= 1000 then
				player:removeMoney(1000)
				npcHandler:say("Here you are.", player)
				talkState[talkUser] = 0
				player:addItem(7243, 1)
			end
		elseif talkState[talkUser] == 3 then
			npcHandler:say("Good! Now listen. To protect the animals there, we have to harm the profit of the hunters. Therefor, I ask you to ruin their best source of earnings. Are you willing to do that?", player)
			talkState[talkUser] = 4
		elseif talkState[talkUser] == 4 then
			npcHandler:say("So let's proceed. Take this vial of paint. Travel to Tyrsung again and ruin as many pelts of baby seals as possible before the paint runs dry or freezes. Then return here to report about your mission. ", player)
			player:addItem(7253, 1)
			player:setStorageValue(12001, 8)
			player:setStorageValue(12028, 1) -- Questlog The Ice Islands Quest, Nibelor 3: Artful Sabotage
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 5 then -- Wings
			if player:getItemCount(5894) >= 5 then
				player:removeItem(5894, 5)
				npcHandler:say("Thank you very much.", player)
				player:setStorageValue(12001, 12)
				talkState[talkUser] = 0
			else
				npcHandler:say("Come back when you do.", player)
			end
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 6 then -- Paws
			if player:getItemCount(5896) >= 4 then
				player:removeItem(5896, 4)
				npcHandler:say("Thank you very much.", player)
				player:setStorageValue(12001, 14)
				talkState[talkUser] = 0
			else
				npcHandler:say("Come back when you do.", player)
			end
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 7 then -- Eyes
			if player:getItemCount(5898) >= 3 then
				player:removeItem(5898, 3)
				npcHandler:say("Thank you very much.", player)
				player:setStorageValue(12001, 16)
				talkState[talkUser] = 0
			else
				npcHandler:say("Come back when you do.", player)
			end
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 8 then -- Fins
			if player:getItemCount(5895) >= 2 then
				player:removeItem(5895, 2)
				npcHandler:say("Thank you very much.", player)
				player:setStorageValue(12001, 18)
				talkState[talkUser] = 0
			else
				npcHandler:say("Come back when you do.", player)
			end
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 9 then -- Scale
			if player:getItemCount(5920) >= 1 then
				player:removeItem(5920, 1)
				npcHandler:say("Thank you very much. This will help us to defend Svargrond. But I heard young Nilsor is in dire need of help. Please contact him immediately.", player)
				player:setStorageValue(12001, 20)
				player:setStorageValue(12029, 6) -- Questlog The Ice Islands Quest, Nibelor 4: Berserk Brewery
				talkState[talkUser] = 0
			else
				npcHandler:say("Come back when you do.", player)
			end
			talkState[talkUser] = 0
		end
	end
	if msgcontains(msg, "buy animal cure") or msgcontains(msg, "animal cure") then -- animal cure for in service of yalahar
		if player:getStorageValue(30) >= 30 and player:getStorageValue(30) <= 54 then
			npcHandler:say("You want to buy animal cure for 400 gold coins?", player)
			talkState[talkUser] = 13
		else
			npcHandler:say("Im out of stock.", player)
		end
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 13 then
		if talkState[talkUser] == 13 and player:removeMoney(400) then
			player:addItem(9734, 1)	
			npcHandler:say("Here you go.", player)
			talkState[talkUser] = 0
		else
			npcHandler:say("You dont have enough of gold coins.", player)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())