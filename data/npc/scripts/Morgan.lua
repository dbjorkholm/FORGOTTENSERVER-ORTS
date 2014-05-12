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

-- Storage IDs --

fknight = 22007
sknight = 22008 
fwarrior = 22038
swarrior = 22041

newaddon = 'Ah, right! The knight sword! Here you go.'
newaddon1 = 'Ah, right! The warrior sword! Here you go.'
noitems = 'You do not have all the required items.'
noitems2 = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already = 'You already have this outfit!'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)
	
	if(msgcontains(msg, 'addon')) then
		selfSay('I can forge the finest {weapons} for knights and warriors. They may wear them proudly and visible to everyone.', cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "firebird") then
		if player:getStorageValue(50002) == 4 then
			selfSay("Ahh. So Duncan sent you, eh? You must have done something really impressive. Okay, take this fine sabre from me, mate.", cid)
			player:setStorageValue(50002, 5)
			player:addOutfitAddon(151, 1)
			player:addOutfitAddon(155, 1)
		end
	elseif(msgcontains(msg, 'weapons') and talkState[talkUser] == 1) then
		selfSay('Would you rather be interested in a {knight\'s sword} or in a {warrior\'s sword}?', cid)
		talkState[talkUser] = 2
	elseif (msgcontains(msg, 'warrior\'s sword') or msgcontains(msg, 'warriors sword')) then
		if talkState[talkUser] == 2 and getPlayerStorageValue(cid, swarrior) < 1 then 
			selfSay('Great! Simply bring me 100 iron ore and one royal steel and I will happily {forge} it for you.', cid)
			talkState[talkUser] = 3
		elseif talkState[talkUser] == 4  and player:getStorageValue(swarrior) < 1 then
			if player:removeItem(5887,1) and player:removeItem(5880,100) then
				selfSay('Alright! As a matter of fact, I have one in store. Here you go!', cid)             
				player:getPosition():sendMagicEffect(13)
				player:setStorageValue(swarrior,1) 
				player:addOutfitAddon(134, 2)
				player:addOutfitAddon(142, 2)   
				talkState[talkUser] = 0
			else
				selfSay(noitems, cid)
				talkState[talkUser] = 0
			end
		elseif talkState[talkUser] > 1 then 
			selfSay(already, cid)
			talkState[talkUser] = 0
		end
	elseif (msgcontains(msg, 'knights sword') or msgcontains(msg, 'knight\'s sword')) then
		if talkState[talkUser] == 2 and player:getStorageValue(fknight) < 1 then
			selfSay('Great! Simply bring me 100 iron ore and one royal steel and I will happily {forge} it for you.', cid)
			talkState[talkUser] = 3
		elseif talkState[talkUser] == 4 and player:getStorageValue(fknight) < 1 then
			if player:removeItem(5892,1) and player:removeItem(5880,100) then
				selfSay('Alright! As a matter of fact, I have one in store. Here you go!', cid)             
				player:getPosition():sendMagicEffect(13)
				player:setStorageValue(fknight,1)
				player:addOutfitAddon(131, 1)
				player:addOutfitAddon(139, 1)
				talkState[talkUser] = 0
			else
				selfSay(noitems, cid)
				talkState[talkUser] = 0
			end
		elseif talkState[talkUser] > 1 then 
			selfSay(already, cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, 'forge') or msgcontains(msg, 'forge weapon')) then
		selfSay('What would you like me to forge for you? A {knight\'s sword} or a {warrior\'s sword}?', cid)
		talkState[talkUser] = 4
	end
	
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
