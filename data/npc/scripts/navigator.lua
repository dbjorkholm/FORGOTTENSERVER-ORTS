local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()							npcHandler:onThink()						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end
function greetCallback(cid)
	local talkUser = cid
	local msg = {"8O'''' |(( JT(|W-T -( J-T =|- (CW- BO:", "Lhnjei gouthn naumpi!"}
	if getPlayerStorageValue(cid, 971) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, msg[1])
		talkState[talkUser] = 1
	else
		npcHandler:setMessage(MESSAGE_GREET, msg[2])
		talkState[talkUser] = 0
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = cid
	if talkState[talkUser] == 1 then
		if msgcontains(msg, "flou") then
		npcHandler:say("Lhnjei gouthn naumpi! So. Another visitor. No, don't say anything, yet - I know why you are here. I can explain everything.", cid)
		setPlayerStorageValue(cid, 971, 1)
		talkState[talkUser] = 0
		return true
		end
		
		npcHandler:say("Motom, buhel!", cid)
		npcHandler:releaseFocus(cid)
		return true
	end
	
	if talkState[talkUser] == 6 then
		if msgcontains(msg, "yes") then
			npcHandler:say({"I control EVERYTHING from this room, navigating the fate of this land for more than a century now. Can you see all these funnels? My voice travels through them and throughout everything down here!\n...","The stones on the beach? The trader up there? That was ME ALL THE TIME! I lured YOU into creating all this chaos up there and down here!\n...","You thought you could choose sides? Think again! I nearly led you into the destruction of two species! ME, THE NAVIGATOR! I CONTROL YOU, I OWN YOU! QJELL AFAR GOU JEY!"}, cid, 7500)
			if getPlayerStorageValue(cid, 970) < 1 then
				setPlayerStorageValue(cid, 970, 1)
			end
			talkState[talkUser] = 0
		return true
		end
		
	npcHandler:say("Maybe another time.", cid)
	talkState[talkUser] = 0
	return true
	end
	
	if talkState[talkUser] == 5 then
		if msgcontains(msg, "yes") then
			npcHandler:say({"Of course you do. And they did, too. They obeyed me. They adored me. They followed me.\n...","I learnt everything about their culture, their life, their goals and their problems. I found out about vile insect-like creatures inhabiting the surface of the land. And their waiting for the return of Qjell.\n...","I practically rewrote their history. I WAS THE SECOND COMING. I WAS QJELL. I, THE NAVIGATOR.\n...","And I navigated them out of their miserable lives. Away from their petty interests. I led them to a greater purpose - to form chaos out of order, to bring back the storm to the seas and to make THINGS MOVE. Do you want to hear the rest as well?"}, cid, 7500)
			talkState[talkUser] = 6
		return true
		end
		
	npcHandler:say("Hmpf.", cid)
	talkState[talkUser] = 0
	return true
	end

	if talkState[talkUser] == 4 then
		if msgcontains(msg, "yes") then
			npcHandler:say({"Hmpf. The armor was working. After some time I was surrounded by darkness and could only see as far as my shimmer glower would me allow to. But I didn't feel the cold - I could even breathe through that helmet.\n...","I dived into the deep black. Across rugged mountains, vast fields of kelp, swarms of strange fish.\n...","And then I laid my eyes on a creature I have never seen before. I now know that they call themselves Njey. You would call them the 'Creatures of the Deep' or 'Deeplings'.\n...","I am now convinced that when they first saw me descending in that suit with the light of the shimmer glower encompassing me, they took me for their God King Qjell. And that's when it all started to make sense. Don't you agree?"}, cid, 7500)
			talkState[talkUser] = 5
		return true
		end
		
	npcHandler:say("Okay. Come back when you decide to hear rest of it.", cid)
	talkState[talkUser] = 0
	return true
	end
	
	if talkState[talkUser] == 3 then
		if msgcontains(msg, "no") then
			npcHandler:say({"When none of my men returned, I forced myself to make a decision. Either dying on this dead ship or plunging into the liquid black beneath.\n...","In my desperation my thoughts fell onto a strange armor - a gift from a trader we dealt with just before the storm. Strange ornaments and fish-like elements decorated this armor. We thought it would fit just perfectly into the captain's cabin.\n...","He said something like a 'blessed breath' and 'to subdue the drift'. We thought he wanted to sell us worthless decoration and make it look interesting. If I had only listened to what he said.\n...","I figured that this thing would have something to do with diving or at least protect me from the icy water. I put it on, grabbed a shimmer glower from our storage to light my path and jumped in.\n...","Do you want me to go on?"}, cid, 7500)
			talkState[talkUser] = 4
		return true
		end
		
	npcHandler:say("Okay. Come back when you decide to hear rest of it.", cid)
	talkState[talkUser] = 0
	return true
	end
	
	if talkState[talkUser] == 2 then
		if msgcontains(msg, "yes") then
			npcHandler:say({"I was once captain of a ship, the Skyflare. We were traders for King Thurin and on our way home when we got into a storm. We fought hard to escape the cold grip of the sea.\n...", "I myself did what I could to navigate the Skyflare out of this mess. They depended on me. Me, the navigator. And I succeeded.\n...", "However, when the sea calmed down and the rain was finally gone, we recognised that our ship wouldn't move. It wasn't my fault.\n...", "There was a strong gale and we could already see this island on the horizon. There were seagulls all around the Skyflare to lead us to dry land. But the ship did not move a single inch. It was NOT my fault.\n...", "We dived under the bow and saw that it was stuck right on the tip of a sharp rock. The world below us was treacherous, we could see large underwater mountains and a labyrinthine system of caves and holes.\n...", "Some of my men panicked and hijacked the dinghies to reach the island, others tried to swim. I remained on the ship. It was not my FAULT. It was not...", "Do you have enough, can I stop?"}, cid, 7500)
			talkState[talkUser] = 3
		return true
		end
		
	npcHandler:say("Maybe another time.", cid)
	talkState[talkUser] = 0
	return true
	end
	
	if talkState[talkUser] == 7 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 15432, 1) then
				npcHandler:say("Then take this one. And remember: DO NOT TELL ANYONE ABOUT ME OR ANYTHING YOU HAVE HEARD HERE TODAY.", cid)
				setPlayerStorageValue(cid, 969, 1)
				Player(cid):addExperience(30000, true, true)
				doPlayerAddOutfit(cid, 463, 2)
				doPlayerAddOutfit(cid, 464, 2)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0
				return true
			end
			npcHandler:say("Come back when you change your mind.", cid)
			talkState[talkUser] = 0
			return true
		end
		
	npcHandler:say("Maybe another time.", cid)
	talkState[talkUser] = 0
	return true
	end
	
	if msgcontains(msg, "explain") then
		npcHandler:say("By entering this place, you have earned the right to learn what this is all about. This is a long story. Are you sure you want to hear this?", cid)
		talkState[talkUser] = 2
		return true
	end
	
	if msgcontains(msg, "helmet") then
		if getPlayerStorageValue(cid, 976) == 4 then
			if getPlayerStorageValue(cid, 969) < 1 then
				npcHandler:say({"NAAAAARGH. If you promise to leave me alone and NOT TO TELL MY SECRET to anyone - you can have one.\n...","NO! Not the one I'm wearing. I am BOUND to this device. This suit has granted me a longer life. However, once you have spent a certain time with this - there is no turning back if you know what I mean.\n...","The armor will merge with your very body. Holding you captive, holding your life in its hands like a ransom.\n...","Using Deepling craft and various components from down here, I created several spare helmets - just in case this one gets damaged. If you return that small golden anchor to me, you can have one. Will you?"}, cid, 7500)
				talkState[talkUser] = 7
				return true
			end
			npcHandler:say({"No more helmets for you. It was unique gift."}, cid, 7500)
			talkState[talkUser] = 0
			return true
		end
		npcHandler:say({"I'd give you one, but it doesn't fit to you."}, cid, 7500)
		talkState[talkUser] = 0
		return true
	end
	
	return true
end
			
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
