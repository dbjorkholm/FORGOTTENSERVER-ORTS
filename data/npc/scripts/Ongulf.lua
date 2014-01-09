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
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1015) < 1) then
			npcHandler:say("Listen, I can handle the organisation down here and my boys will handle the construction of the base fine enough. Actually, all you do down here is to stand in the workers' way. ...", cid)
			npcHandler:say("But there might be something for you to do outside the base. We need to learn more about the land up there. Take the lift and do some exploring. Find a passage leading out of the mountains. ...", cid)
			npcHandler:say("Do not explore any further though. You never know whom you might be messing with.", cid)
			setPlayerStorageValue(cid, 1015, 1)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 2) then
			npcHandler:say("Excellent. Although we have no idea what awaits us in this foreign land, it is always good to know something more about our surroundings. ", cid)
			npcHandler:say("", cid)
			setPlayerStorageValue(cid, 1015, 3)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 3) then
			npcHandler:say("Things are running fine so far. Actually so fine that we are short of supplies and men. I'd send a letter home but I guess sending you to get some assistance gives the whole affair a bit more urgency. ...", cid)
			npcHandler:say("So please travel back to Kazordoon. In the western mines outside of The Big Old One, you'll find Melfar of the imperial mining guild. Ask him to send some more miners and wood. When you return, I might have some more interesting missions for you.", cid)
			setPlayerStorageValue(cid, 1015, 4)
			talkState[talkUser] = 0	
		elseif(getPlayerStorageValue(cid, 1015) == 7) then
			npcHandler:say("That's good news for sure. It will give our operation a new impulse. However, only if there is not some unexpected trouble ahead. Well, we'll talk about that when we discuss your next mission. ", cid)
			setPlayerStorageValue(cid, 1015, 8)
			talkState[talkUser] = 0	
		elseif(getPlayerStorageValue(cid, 1015) == 8) then
			npcHandler:say("Our guards reported some nightly visitors. They chased them through the mountains but lost them when the fugitives climbed up some vines. ...", cid)
			npcHandler:say("It could easily be some trap and I'm somewhat reluctant to send you there, but we can't allow some invisible aggressor to spy on us and maybe to prepare an attack. ...", cid)
			npcHandler:say("Find these vines in this mountain, climb up there and find out who is spying on us! If they mean harm, get rid of them if possible. ...", cid)
			npcHandler:say("If they are too powerful, just retreat and we will have to re-evaluate the situation. If they are harmless, all the better.", cid)
			setPlayerStorageValue(cid, 1015, 9)
			talkState[talkUser] = 0	
		elseif(getPlayerStorageValue(cid, 1015) == 10) then
			npcHandler:say("Primitive humans you say? These are most startling news, that's for sure. Well, I guess I'll send some victuals we can spare as a sign of our good will. ...", cid)
			npcHandler:say("However, our miners encountered another problem in the meantime. I'm afraid this will be your next mission", cid)
			setPlayerStorageValue(cid, 1015, 11)
			talkState[talkUser] = 0	
		elseif(getPlayerStorageValue(cid, 1015) == 11) then
			npcHandler:say("It seems things went from bad to worse! First we had some problems with the mine shafts we were building, and now that we found some precious veins in one of the new mines, and it happens to be the holiday resort of some hostile stone creatures! ...", cid)
			npcHandler:say("Nothing we dwarfs couldn't handle alone, but I rather thought this could be something interesting for an adventurer like you. ...", cid)
			npcHandler:say("So I reserved you the privilege to slay the leader! Use the mining lift to reach mine A07. The more stone creatures you kill, the better. Your mission, however, is to slay their leader, most likely some special stone beast.", cid)
			setPlayerStorageValue(cid, 1015, 12)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 13) then
			npcHandler:say("Shortly after you killed that creature, the others crumbled to dust and stone. I hope this incident does not foreshadow similar problems in our mines. However, for now I have other things to take care of and you have other missions to accomplish. ", cid)
			setPlayerStorageValue(cid, 1015, 14)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 14) then
			npcHandler:say("Things are getting more and more complicated. You need to convince our friends that some intervention for their part is needed. ... ", cid)
			npcHandler:say("We've come a long way with our own resources, but now our resources are short and we need the others to step in. I want you to negotiate some more support from our partners. ... ", cid)
			npcHandler:say("You'll need all your diplomacy and influence. If you blow the negotiations, look for a guy called Black Bert in Thais. ... ", cid)
			npcHandler:say("He has access to all kind of odd items, and he might have just the right bribe to convince someone to continue negotiations. ... ", cid)
			npcHandler:say("It will not be as easy as it might sound. So watch your words and your manners and keep in mind whom you are talking to. ... ", cid)
			npcHandler:say("Different strategies might be necessary for different people. You may try to FLATTER, THREATEN, IMPRESS, BLUFF, PLEA or to REASON with them. You probably need some luck as well. ... ", cid)
			npcHandler:say("And now listen: We need more workers for the mines. The technomancers told us that a guy named Telas, who lives in Edron, copied the worker golem technology from Yalahar. Convince him to send us some of these golems. ... ", cid)
			npcHandler:say("Further, we have more ore and end products than we can use right now. So we need someone to buy all the surplus. Convince Leeland Slim in Venore that the local traders step in as resellers. ... ", cid)
			npcHandler:say("Another issue at hand is our lack of drilling worms. That should not be a big problem though. Just talk to the worm tamer in Kazordoon. If he does not get mad about you, there should be no problem to get his support. ... ", cid)
			npcHandler:say("Also, now that our monetary resources are used up and not much cash is coming in, we need additional help to finance this venture. Thais has promised money in advance, but we haven't seen any of this support, yet. ... ", cid)
			npcHandler:say("Convince the Thaian king to send us the promised money right now. ... ", cid)
			npcHandler:say("Another problem we need to solve is the exploration of our surroundings. We need to know friends and enemies, and find out about the plants and beasts in the vicinity and learn what is edible and what is dangerous. ... ", cid)
			npcHandler:say("This is all stuff the Explorer Society is interested in. It should be easy to convince their representative in Port Hope. ... ", cid)
			npcHandler:say("At last, with the growing numbers of adventurers here, not only the security of the base is growing but also the demand for certain supplies. I'd like the Edron academy to open up a shop in the base. We need to keep you adventurers happy, don't we? ... ", cid)
			npcHandler:say("Well, I hope you understand the importance of this mission and got what it takes to fulfil it. So hurry up and get us the needed support. ", cid)
			setPlayerStorageValue(cid, 1015, 15)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 15) then
			if(getPlayerStorageValue(cid, 1020) == 1 and getPlayerStorageValue(cid, 1021) == 1 and getPlayerStorageValue(cid, 1022) == 1 and getPlayerStorageValue(cid, 1023) == 1 and getPlayerStorageValue(cid, 1024) == 1 and getPlayerStorageValue(cid, 1025) == 1) then
				npcHandler:say("Shortly after you killed that creature, the others crumbled to dust and stone. I hope this incident does not foreshadow similar problems in our mines. However, for now I have other things to take care of and you have other missions to accomplish. ", cid)
				setPlayerStorageValue(cid, 1015, 16)
				talkState[talkUser] = 0
			end
		elseif(getPlayerStorageValue(cid, 1015) == 16) then
			npcHandler:say("Our new friends, those primitive humans sent us a warning. According to them, the 'green men' of the plains plan an attack on the mountains. ...", cid)
			npcHandler:say("Considering their expected number, there is no chance for us to beat them off. We might be able to hold our ground for a while, but without access to the surface and under constant attacks, we might have to abandon the base. ...", cid)
			npcHandler:say("Now, I'm aware that you cannot stop an entire army by yourself, but desperate situations call for desperate measures. I ask you to find the leaders of the orcs and - well do something. ...", cid)
			npcHandler:say("Scare them, bribe them, give them another target or whatever. As futile as it may sound: Try to talk to their leaders in some way and make them stop their attack plans. This is our only hope.", cid)	
			setPlayerStorageValue(cid, 1015, 17)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 20) then
			npcHandler:say("Oh my. What a mess you have gotten yourself into. Well, at least you made it out alive. Whatever the value of a minotaur's promise might be, I guess that is the best we can get. ...", cid)
			npcHandler:say("Of course all those revelations lead to new problems and a new mission for you. ", cid)
			setPlayerStorageValue(cid, 1015, 21)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 21) then
			npcHandler:say("Ooook. Now that we managed to keep those orcs and minotaurs at bay at least for a while, we learn that the real meanies over here are some lizardmen. Just great, isn't it?. ...", cid)
			npcHandler:say("So you might already guess your next mission: Find a way to hold those lizards off. Find them, contact them, talk to them, scare them, bribe them, whatever. Just keep that snakes away if anyhow possible. ...", cid)
			npcHandler:say("If the orcs are right, they are somewhere in or behind those mountains in the north. I doubt you can reason with them in any way, but you'll have to try for the sake of Farmine.", cid)
			setPlayerStorageValue(cid, 1015, 22)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 1015) == 27) then
			npcHandler:say("Oh, my! That sounds like a real mess. For now this dragon empire seems otherwise engaged, but we will be on guard thanks to you my friend. We will continue to fortify the base. ...", cid)
			npcHandler:say("This leaves not much to do for you down here. I recommend you continue to explore this strange new land. ...", cid)
			npcHandler:say("I'm pretty sure there are several opportunities at hand for an adventurer like you. ...", cid)
			npcHandler:say("Perhaps you can help the primitives you encountered. Who knows, maybe even those minotaurs give you a chance to fortify this fragile peace between us. ...", cid)
			npcHandler:say("Even some of the people here in the base might offer you some tasks sooner or later. If you prefer, you can also do some exploring, hunting and good ol' plundering on your own of course. ...", cid)
			npcHandler:say("This new land is yours to be taken, so to say. Go out and make your fortune! With Farmine you have always a safe haven to return to. ...", cid)
			npcHandler:say("Oh and one last thing: We convinced a carpet pilot to join us here. You'll find him on top of our lift in the mountains. I think he can offer you fast access to some cities back home. ", cid)
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 366 or 367, 0)
			setPlayerStorageValue(cid, 1015, 28)
			talkState[talkUser] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
