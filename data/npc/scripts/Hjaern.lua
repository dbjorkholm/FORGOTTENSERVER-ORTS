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
		if player:getStorageValue(12001) == 3 then
			if player:getStorageValue(12026) < 1 then
			npcHandler:say({"We could indeed need some help. These are very cold times. The ice is growing and becoming thicker everywhere ...",
							"The problem is that the chakoyas may use the ice for a passage to the west and attack Svargrond ...",
							"We need you to get a pick and to destroy the ice at certain places to the east. You will quickly recognise those spots by their unstable look ...",
							"Use the pickaxe on at least three of these places and the chakoyas probably won't be able to pass the ice. Once you are done, return here and report about your mission. "}, player, 0, 1, 3500)
			player:setStorageValue(12026, 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			talkState[talkUser] = 0
			end
		elseif player:getStorageValue(12001) == 4 then
			npcHandler:say("The spirits are at peace now. The threat of the chakoyas is averted for now. I thank you for your help. Perhaps you should ask Silfind if you can help her in some matters. ", player)
			player:setStorageValue(12001, 5)
			player:setStorageValue(12026, 5) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 29 then
			npcHandler:say({"There is indeed an important mission. For a long time, the spirits have been worried and have called us for help. It seems that some of our dead have not reached the happy hunting grounds of after life ...",
							"Everything we were able to find out leads to a place where none of our people is allowed to go. Just like we would never allow a stranger to go to that place ...",
							"But you, you are different. You are not one of our people, yet you have proven worthy to be one us. You are special, the child of two worlds ...",
							"We will grant you permission to travel to that isle of Helheim. Our legends say that this is the entrance to the dark world. The dark world is the place where the evil and lost souls roam in eternal torment ...",
							"There you find for sure the cause for the unrest of the spirits. Find someone in Svargrond who can give you a passage to Helheim and seek for the cause. Are you willing to do that?"}, player, 0, 1, 3500)
			talkState[talkUser] = 1
		elseif player:getStorageValue(12001) == 31 then
			npcHandler:say({"There is no need to report about your mission. To be honest, Ive sent a divination spirit with you as well as a couple of destruction spirits that were unleashed when you approached the altar ...",
							"Forgive me my secrecy but you are not familiar with the spirits and you might have get frightened. The spirits are at work now, destroying the magic with that those evil creatures have polluted Helheim ...",
							"I cant thank you enough for what you have done for the spirits of my people. Still I have to ask: Would you do us another favour?"}, player, 0, 1, 3500)
			talkState[talkUser] = 2
		elseif player:getStorageValue(12001) == 38 then
			npcHandler:say({"These are alarming news and we have to act immediately. Take this spirit charm of cold. Travel to the mines and find four special obelisks to mark them with the charm ...",
							"I can feel their resonance in the spirits world but we cant reach them with our magic yet. They have to get into contact with us in a spiritual way first ...",
							"This will help us to concentrate all our frost magic on this place. I am sure this will prevent to melt any significant number of demons from the ice ...",
							"Report about your mission when you are done. Then we can begin with the great ritual of summoning the children of Chyll ...",
							"I will also inform Lurik about the events. Now go, fast!"}, player, 0, 1, 3500)
			player:setStorageValue(12001, 39)
			player:addItem(7289, 1)
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 39 then
			for i = 100, 103 do
				if player:getStorageValue(i + 40) < 1 then
					return true
				end
			end
			if player:getItemCount(7289) >= 1 then
				player:removeItem(7289, 1)
				player:setStorageValue(12001, 40)
				player:addOutfit(player:getSex() == 0 and 252 or 251, 0)
				npcHandler:say({"Yes, I can feel it! The spirits are in touch with the obelisks. We will begin to channel a spell of ice on the caves. That will prevent the melting of the ice there ...",
								"If you would like to help us, you can turn in frostheart shards from now on. We use them to fuel our spell with the power of ice. ...",
								"Oh, and before I forget it - since you have done a lot to help us and spent such a long time in this everlasting winter, I have a special present for you. ...",
								"Take this outfit to keep your warm during your travels in this frozen realm!"}, player, 0, 1, 3500)
			end
			talkState[talkUser] = 0
		else 
		npcHandler:say("I have now no mission for you.", player)
		talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "shard") then
		if player:getStorageValue(12001) == 40 then
			npcHandler:say("Do you bring frostheart shards for our spell?", player)
			talkState[talkUser] = 3
		elseif player:getStorageValue(12001) == 42 then
			npcHandler:say("Do you bring frostheart shards for our spell? ", player)
			talkState[talkUser] = 4
		elseif player:getStorageValue(12001) == 44 then
			npcHandler:say("Do you want to sell all your shards for 2000 gold coins per each? ", player)
			talkState[talkUser] = 5
		end
	elseif msgcontains(msg, "reward") then
		if player:getStorageValue(12001) == 41 then
			npcHandler:say("Take this. It might suit your Nordic outfit fine. ", player)
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 252 or 251, 1)
			player:setStorageValue(12001, 42)
			talkState[talkUser] = 3
		elseif player:getStorageValue(12001) == 43 then
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 252 or 251, 2)
			npcHandler:say("Take this. It might suit your Nordic outfit fine. From now on we only can give you 2000 gold pieces for each shard. ", player)
			player:setStorageValue(12001, 44)
			talkState[talkUser] = 4
		end
	elseif msgcontains(msg, "tylaf") then
		if player:getStorageValue(12001) == 37 then
			npcHandler:say({"You encountered the restless ghost of my apprentice Tylaf in the old mines? We must find out what has happened to him. I enable you to talk to his spirit ...",
							"Talk to him and then report to me about your mission."}, player, 0, 1, 3500)
			player:setStorageValue(12001, 38)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then
			npcHandler:say("This is good news. As I explained, travel to Helheim, seek the reason for the unrest there and then report to me about your mission. ", player)
			player:setStorageValue(12001, 30)
			player:setStorageValue(12031, 2) -- Questlog The Ice Islands Quest, The Secret of Helheim
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 2 then
			npcHandler:say({"Thank you my friend. The local representative of the explorers society has asked for our help ...",
							"You know their ways better than my people do and are probably best suited to represent us in this matter.",
							"Search for Lurik and talk to him about aprobable mission he might have for you. "}, player, 0, 1, 3500)
			player:setStorageValue(12001, 32)
			player:setStorageValue(12032, 1) -- Questlog The Ice Islands Quest, The Contact
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 3 then
			if player:getItemCount(7290) >= 5 then
				player:removeItem(7290, 5)
				npcHandler:say("Excellent, you collected 5 of them. If you have collected 5 or more, talk to me about your reward. ", player)
				player:setStorageValue(12001, 41)
				talkState[talkUser] = 0
			end
		elseif talkState[talkUser] == 4 then
			if player:getItemCount(7290) >= 15 then
				player:removeItem(7290, 15)
				npcHandler:say("Excellent, you collected 15 of them. If you have collected 15 or more, talk to me about your reward. ", player)
				player:setStorageValue(12001, 43)
				talkState[talkUser] = 0
			end
		elseif talkState[talkUser] == 5 then
			if player:getItemCount(7290) >= 1 then
				count = player:getItemCount(7290)
				player:addMoney(count * 2000)
				player:removeItem(7290, count)
				npcHandler:say("Here your are. " .. count * 2000 .. " gold coins for " .. count .. " shards.", player)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())