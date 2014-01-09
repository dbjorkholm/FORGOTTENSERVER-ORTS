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
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	
	if(msgcontains(msg, "barbarians")) then
		if(getPlayerStorageValue(cid, 120) < 1) then
			npcHandler:say("A true barbarian is something special among our people. Everyone who wants to become a barbarian will have to pass the barbarian test.", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "test")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("All of our juveniles have to take the barbarian test to become a true member of our community. Foreigners who manage to master the test are granted the title of an honorary barbarian and the respect of our people ...", cid)
			npcHandler:say("Are you willing to take the barbarian test?", cid)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "mead")) then
		if(getPlayerStorageValue(cid, 120) == 1) then
			npcHandler:say("Do you have some honey with you?", cid)
			talkState[talkUser] = 4
		elseif(getPlayerStorageValue(cid, 120) == 3) then
			npcHandler:say("An impressive start. Here, take your own mead horn to fill it at the mead bucket as often as you like ...", cid)
			npcHandler:say("But there is much left to be done. Your next test will be to hug a bear ...", cid)
			npcHandler:say("You will find one in a cave north of the town. If you are lucky, it's still sleeping. If not ... well that might hurt ...", cid)
			npcHandler:say("Unless you feel that you hugged the bear, the test is not passed. Once you are done, talk to me about the bear hugging.", cid)
			setPlayerStorageValue(cid, 120, 4)
			doPlayerAddItem(cid, 7140, 1)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "hug")) then
		if(getPlayerStorageValue(cid, 120) == 5) then
			npcHandler:say("Amazing. That was as clever and brave as a barbarian is supposed to be. But a barbarian also has to be strong and fearless. To prove that you will have to knock over a mammoth ...", cid)
			npcHandler:say("Did your face just turn into the color of fresh snow? However, you will find a lonely mammoth north west of the town in the wilderness. Knock it over to prove to be a true barbarian ...", cid)
			npcHandler:say("Return to me and talk about the mammoth pushing when you are done.", cid)
			setPlayerStorageValue(cid, 120, 6)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "mammoth")) then
		if(getPlayerStorageValue(cid, 120) == 6) then
			npcHandler:say("As you have passed all three tests, I welcome you in our town as an honorary barbarian. You can now become a citizen. Don't forget to talk to the people here. Some of them might need some help ...", cid)
			npcHandler:say("We usually solve our problems on our own but some of the people might have a mission for you. Old Iskan, on the ice in the northern part of the town had some trouble with his dogs lately.", cid)
			setPlayerStorageValue(cid, 120, 7)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say("That's the spirit! The barbarian test consists of a few tasks you will have to fulfill. All are rather simple - for a barbarian that is...", cid)
			npcHandler:say("Your first task is to drink some barbarian mead. But be warned, it's a strong brew that could even knock out a bear. You need to make at least ten sips of mead in a row without passing out to pass the test ...", cid)
			npcHandler:say("Do you think you can do this?", cid)
			talkState[talkUser] = 3
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("Good, but to make barbarian mead we need some honey which is rare here. I'd hate to waste mead just to learn you're not worth it ...", cid)
			npcHandler:say("Therefore, you have to get your own honey. You'll probably need more than one try so better get some extra honeycombs. Then talk to me again about barbarian mead.", cid)
			npcHandler:say("", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 120, 1)
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 5902) >= 1) then
				doPlayerRemoveItem(cid, 5902, 1)
				npcHandler:say("Good, for this honeycomb I allow you 20 sips from the mead bucket over there. Talk to me again about barbarian mead if you have passed the test.", cid)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, 120, 2)
				setPlayerStorageValue(cid, 118, 0)
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())