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
	
	if msgcontains(msg, "do for you") then
			npcHandler:say("I run the dog sled service from this city to {Nibelor}.", player)
	elseif msgcontains(msg, "Nibelor") or msgcontains(msg, "passage") then
			npcHandler:say("Do you want to Nibelor?", player)
			talkState[talkUser] = 2
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(120) >= 8 then -- if Barbarian Test absolved 
			if player:getStorageValue(12001) < 1 then
				npcHandler:say({"Well, one of the boys has run away. I think he got the scent of some beast. He's young and inexperienced so I can't blame the cub ...",
								"I would like you to see after him. He should be somewhere north west of the town. He is probably marking his territory so you should be able to find his trace. Are you willing to do that?"}, player, 0, 1, 4000)
				talkState[talkUser] = 1
			elseif player:getStorageValue(12001) == 2 then
				npcHandler:say("You are a friend of mine and the boys now. I tell you something. If you ever need to go to the isle of Nibelor, just ask me for a {passage}.", player)
				player:setStorageValue(12001, 3)
				player:setStorageValue(12025, 3) -- Questlog The Ice Islands Quest, Befriending the Musher
				talkState[talkUser] = 0
			else 
			npcHandler:say("I have now no mission for you.", player)
			talkState[talkUser] = 0
			end
		else
			npcHandler:say("Sorry but I only give missions to those who are considered a true Barbarian. ", player)
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then
			npcHandler:say({"That's surprising. Take a piece of meat. If you find the boy, feed it to him. That will give him enough strength and incentive to return to his pack ...",
							"Talk to him by calling his name 'Sniffler' and tell him you got meat for him. After he has eaten the meat, return here to talk to me about your mission."}, player, 0, 1, 3500)
			player:setStorageValue(12001, 1)
			player:setStorageValue(12025, 1) -- Questlog The Ice Islands Quest, Befriending the Musher
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 2 then
			if player:getStorageValue(12001) >= 3 then
			local port = {x = 32325, y = 31049, z = 7}
			player:teleportTo(port)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			talkState[talkUser] = 0
			else
			npcHandler:say("Sorry, first time you have to do a mission for me.", player)
			talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())