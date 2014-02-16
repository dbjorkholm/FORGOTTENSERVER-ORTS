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

local sellList = 
{
	{itemId = 7414, price = 20000},
	{itemId = 7426, price = 8000},
	{itemId = 2142, price = 200},
	{itemId = 7404, price = 20000},
	{itemId = 5917, price = 150},
	{itemId = 3962, price = 1500},
	{itemId = 11374, price = 1500},
	{itemId = 7403, price = 40000},
	{itemId = 7406, price = 6000},
	{itemId = 7429, price = 40000},
	{itemId = 2541, price = 80},
	{itemId = 3972, price = 7500},
	{itemId = 7379, price = 1500},
	{itemId = 20109, price = 7000},
	{itemId = 2535, price = 5000},
	{itemId = 8850, price = 40000},
	{itemId = 7427, price = 9000},
	{itemId = 12630, price = 50000},
	{itemId = 9931, price = 500},
	{itemId = 8855, price = 25000},
	{itemId = 7415, price = 30000},
	{itemId = 3982, price = 1000},
	{itemId = 18453, price = 35000},
	{itemId = 2445, price = 12000},
	{itemId = 2125, price = 400},
	{itemId = 6093, price = 250},
	{itemId = 7449, price = 600},
	{itemId = 8878, price = 16000},
	{itemId = 2521, price = 400},
	{itemId = 6301, price = 1000},
	{itemId = 2520, price = 30000},
	{itemId = 14333, price = 32000},
	{itemId = 7382, price = 36000},
	{itemId = 2462, price = 1000},
	{itemId = 7387, price = 3000},
	{itemId = 8885, price = 55000},
	{itemId = 2451, price = 15000},
	{itemId = 2110, price = 200},
	{itemId = 2492, price = 40000},
	{itemId = 7402, price = 15000},
	{itemId = 7430, price = 3000},
	{itemId = 7419, price = 10000},
	{itemId = 2503, price = 30000},
	{itemId = 7866, price = 30000},
	{itemId = 7858, price = 15000},
	{itemId = 7862, price = 6000},
	{itemId = 7861, price = 30000},
	{itemId = 7856, price = 30000},
	{itemId = 7867, price = 6000},
	{itemId = 7855, price = 25000},
	{itemId = 7863, price = 12000},
	{itemId = 7438, price = 2000},
	{itemId = 2127, price = 800},
	{itemId = 7881, price = 30000},
	{itemId = 7873, price = 15000},
	{itemId = 7877, price = 6000},
	{itemId = 7876, price = 30000},
	{itemId = 7871, price = 30000},
	{itemId = 7882, price = 6000},
	{itemId = 7870, price = 25000},
	{itemId = 7878, price = 12000},
	{itemId = 2438, price = 8000},
	{itemId = 7756, price = 30000},
	{itemId = 7748, price = 15000},
	{itemId = 7752, price = 6000},
	{itemId = 7751, price = 30000},
	{itemId = 7746, price = 30000},
	{itemId = 7757, price = 6000},
	{itemId = 7745, price = 25000},
	{itemId = 7753, price = 12000},
	{itemId = 9929, price = 1000},
	{itemId = 9927, price = 500},
	{itemId = 7457, price = 2000},
	{itemId = 7432, price = 1000},
	{itemId = 7888, price = 1500},
	{itemId = 7896, price = 11000},
	{itemId = 7902, price = 2500},
	{itemId = 7897, price = 11000},
	{itemId = 7892, price = 2500},
	{itemId = 2179, price = 8000},
	{itemId = 2466, price = 20000},
	{itemId = 2470, price = 30000},
	{itemId = 2427, price = 11000},
	{itemId = 2444, price = 30000},
	{itemId = 7380, price = 6000},
	{itemId = 2452, price = 50000},
	{itemId = 2442, price = 90},
	{itemId = 13838, price = 2000},
	{itemId = 20132, price = 2000},
	{itemId = 7389, price = 30000},
	{itemId = 8873, price = 3000},
	{itemId = 7766, price = 6000},
	{itemId = 7775, price = 30000},
	{itemId = 7767, price = 15000},
	{itemId = 7771, price = 6000},
	{itemId = 7770, price = 30000},
	{itemId = 7765, price = 30000},
	{itemId = 7776, price = 6000},
	{itemId = 7764, price = 25000},
}

function onTradeRequest(cid)
	if(getPlayerStorageValue(cid, 85) >= 20) then
		npcHandler:say("Feel free to offer me your wares!", cid)
		return true
	else
		npcHandler:say("I don't trade with not recognized traders.", cid)
		return false
	end
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "mission")) then
		if(os.date("%A") == "Monday") then
			if(getPlayerStorageValue(cid, 85) < 1) then
				npcHandler:say("Well, you could attempt the mission to become a recognised trader, but it requires a lot of travelling. Are you willing to try?", cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid, 85) == 1) then
				npcHandler:say("Have you managed to obtain a rare deer trophy for my customer?", cid)
				talkState[talkUser] = 3
			end
		elseif(os.date("%A") == "Tuesday") then
			if(getPlayerStorageValue(cid, 85) == 2) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				talkState[talkUser] = 4
			elseif(getPlayerStorageValue(cid, 85) == 6) then
				npcHandler:say("Did you bring me the package?", cid)
				talkState[talkUser] = 6
			end
		elseif(os.date("%A") == "Wednesday") then
			if(getPlayerStorageValue(cid, 85) == 7) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				talkState[talkUser] = 7
			elseif(getPlayerStorageValue(cid, 85) == 9) then
				npcHandler:say("Have you brought the cheese?", cid)
				talkState[talkUser] = 9
			end
		elseif(os.date("%A") == "Thursday") then
			if(getPlayerStorageValue(cid, 85) == 10) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				talkState[talkUser] = 10
			elseif(getPlayerStorageValue(cid, 85) == 12) then
				npcHandler:say("Have you brought the vase?", cid)
				talkState[talkUser] = 12
			end
		elseif(os.date("%A") == "Friday") then
			if(getPlayerStorageValue(cid, 85) == 13) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				talkState[talkUser] = 13
			elseif(getPlayerStorageValue(cid, 85) == 15) then
				npcHandler:say("Have you brought a cheap but good crimson sword?", cid)
				talkState[talkUser] = 15
			end
		elseif(os.date("%A") == "Saturday") then
			if(getPlayerStorageValue(cid, 85) == 17) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				talkState[talkUser] = 16
			elseif(getPlayerStorageValue(cid, 85) == 18) then
				npcHandler:say("Have you brought me a gold fish??", cid)
				talkState[talkUser] = 18
			end
		elseif(os.date("%A") == "Sunday") then
			if(getPlayerStorageValue(cid, 85) == 19) then
				npcHandler:say("Ah, right. <ahem> I hereby declare you - one of my recognised traders! Feel free to offer me your wares!", cid)
				setPlayerStorageValue(cid, 85, 20)
				talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Very good! I need talented people who are able to handle my wares with care, find good offers and the like, so I'm going to test you. ...", cid)
			npcHandler:say("First, I'd like to see if you can dig up rare wares. Something like a ... mastermind shield! ...", cid)
			npcHandler:say("Haha, just kidding, fooled you there, didn't I? Always control your nerves, that's quite important during bargaining. ...", cid)
			npcHandler:say("Okay, all I want from you is one of these rare deer trophies. I have a customer here in Svargrond who ordered one, so I'd like you to deliver it tome while I'm in Svargrond. ...", cid)
			npcHandler:say("Everything clear and understood?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Fine. Then get a hold of that deer trophy and bring it to me while I'm in Svargrond. Just ask me about your mission.", cid)
			setPlayerStorageValue(cid, 85, 1)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 7397) >= 1) then
				doPlayerRemoveItem(cid, 7397, 1)
				npcHandler:say("Well done! I'll take that from you. <snags it> Come see me another day, I'll be busy for a while now. ", cid)
				setPlayerStorageValue(cid, 85, 2)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 4) then
			npcHandler:say("Alright, that's good to hear. From you as my trader and deliveryman, I expect more than finding rare items. ...", cid)
			npcHandler:say("You also need to be able to transport heavy wares, weaklings won't get far here. I have ordered a special package from Edron. ...", cid)
			npcHandler:say("Pick it up from Willard and bring it back to me while I'm in Liberty Bay. Everything clear and understood?", cid)
			talkState[talkUser] = 5
		elseif(talkState[talkUser] == 5) then
			npcHandler:say("Fine. Then off you go, just ask Willard about the 'package for Rashid'.", cid)
			setPlayerStorageValue(cid, 85, 3)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid, 7503) >= 1) then
				doPlayerRemoveItem(cid, 7503, 1)
				npcHandler:say("Great. Just place it over there - yes, thanks, that's it. Come see me another day, I'll be busy for a while now. ", cid)
				setPlayerStorageValue(cid, 85, 7)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 7) then
			npcHandler:say("Well, that's good to hear. From you as my trader and deliveryman, I expect more than carrying heavy packages. ...", cid)
			npcHandler:say("You also need to be fast and deliver wares in time. I have ordered a very special cheese wheel made from Darashian milk. ...", cid)
			npcHandler:say("Unfortunately, the high temperature in the desert makes it rot really fast, so it must not stay in the sun for too long. ...", cid)
			npcHandler:say("I'm also afraid that you might not be able to use ships because of the smell of the cheese. ...", cid)
			npcHandler:say("Please get the cheese from Miraia and bring it to me while I'm in Port Hope. Everything clear and understood?", cid)
			talkState[talkUser] = 8
		elseif(talkState[talkUser] == 8) then
			npcHandler:say("Okay, then please find Miraia in Darashia and ask her about the {'scarab cheese'}.", cid)
			setPlayerStorageValue(cid, 85, 8)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 9) then
			if(getPlayerItemCount(cid, 8112) >= 1) then
				doPlayerRemoveItem(cid, 8112, 1)
				npcHandler:say("Mmmhh, the lovely odeur of scarab cheese! I really can't understand why most people can't stand it. Thanks, well done! ", cid)
				setPlayerStorageValue(cid, 85, 10)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 10) then
			npcHandler:say("Well, that's good to hear. From you as my trader and deliveryman, I expect more than bringing stinky cheese. ...", cid)
			npcHandler:say("I wonder if you are able to deliver goods so fragile they almost break when looked at. ...", cid)
			npcHandler:say("I have ordered a special elven vase from Briasol in Ab'Dendriel. Get it from him and don't even touch it, just bring it to me while I'm in Ankrahmun. Everything clear and understood?", cid)
			talkState[talkUser] = 11
		elseif(talkState[talkUser] == 11) then
			npcHandler:say("Okay, then please find {Briasol} in {Ab'Dendriel} and ask for a {'fine vase'}.", cid)
			setPlayerStorageValue(cid, 85, 11)
			doPlayerAddMoney(cid, 1000)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 12) then
			if(getPlayerItemCount(cid, 8760) >= 1) then
				doPlayerRemoveItem(cid, 8760, 1)
				npcHandler:say("I'm surprised that you managed to bring this vase without a single crack. That was what I needed to know, thank you. ", cid)
				setPlayerStorageValue(cid, 85, 13)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 13) then
			npcHandler:say("Fine! There's one more skill that I need to test and which is cruicial for a successful trader. ...", cid)
			npcHandler:say("Of course you must be able to haggle, else you won't survive long in this business. To make things as hard as possible for you, I have the perfect trade partner for you. ...", cid)
			npcHandler:say("Dwarves are said to be the most stubborn of all traders. Travel to Kazordoon and try to get the smith Uzgod to sell a crimson sword to you. ...", cid)
			npcHandler:say("Of course, it has to be cheap. Don't come back with anything more expensive than 400 gold. ...", cid)
			npcHandler:say("And the quality must not suffer, of course! Everything clear and understood?", cid)
			npcHandler:say("Dwarves are said to be the most stubborn of all traders. Travel to Kazordoon and try to get the smith Uzgod to sell a crimson sword to you. ...", cid)
			talkState[talkUser] = 14
		elseif(talkState[talkUser] == 14) then
			npcHandler:say("Okay, I'm curious how you will do with {Uzgod}. Good luck!", cid)
			setPlayerStorageValue(cid, 85, 14)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 15) then
			if(getPlayerItemCount(cid, 7385) >= 1) then
				doPlayerRemoveItem(cid, 7385, 1)
				npcHandler:say("Ha! You are clever indeed, well done! I'll take this from you. Come see me tomorrow, I think we two might get into business after all.", cid)
				setPlayerStorageValue(cid, 85, 16)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 16) then
			npcHandler:say("My friend, it seems you have already learnt a lot about the art of trading. I think you are more than worthy to become a recognised trader. ...", cid)
			npcHandler:say("There is just one little favour that I would ask from you... something personal, actually, forgive my boldness. ...", cid)
			npcHandler:say("I have always dreamed to have a small pet, one that I could take with me and which wouldn't cause problems. ...", cid)
			npcHandler:say("Could you - just maybe - bring me a small goldfish in a bowl? I know that you would be able to get one, wouldn't you?", cid)
			talkState[talkUser] = 17
		elseif(talkState[talkUser] == 17) then
			npcHandler:say("Thanks so much! I'll be waiting eagerly for your return then.", cid)
			setPlayerStorageValue(cid, 85, 17)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 18) then
			if(getPlayerItemCount(cid, 8766) >= 1) then
				doPlayerRemoveItem(cid, 8766, 1)
				npcHandler:say("Thank you!! Ah, this makes my day! I'll take the rest of the day off to get to know this little guy. Come see me tomorrow, if you like.", cid)
				setPlayerStorageValue(cid, 85, 19)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())