local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
 
if(not npcHandler:isFocused(cid)) then
	return false
end
 
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({'rent', 'mount', 'horse'}, msg) then
	npcHandler:say("You can rent a {rented horse}!", cid)
	talkState[talkUser] = 1
elseif talkState[talkUser] == 1 then
	if rent_mounts[msg] then
		if rent_mounts[msg].premium == true and not isPremium(cid) then
			npcHandler:say('You need to be premium to rent this mount.', cid) return true
		elseif getPlayerLevel(cid) < rent_mounts[msg].level then
			npcHandler:say('You need level ' .. rent_mounts[msg].level .. ' or more to rent this mount.', cid) return true
		elseif getPlayerStorageValue(cid, rent_mounts[msg].storage) >= os.time() then
			npcHandler:say('you already have rented this mount!', cid) return true
		end
		name,price,stor,days,mountid = msg,rent_mounts[msg].price,rent_mounts[msg].storage,rent_mounts[msg].days,rent_mounts[msg].mountid
		npcHandler:say('You want to rent the mount '..name..' for '..days..' day'..(days > 1 and 's' or '')..' the price '..price..' gps? {yes}', cid)
		talkState[talkUser] = 2
	else
		npcHandler:say('Sorry, I do not sell this mount.', cid)
	end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
	if doPlayerRemoveMoney(cid, price) then
		doPlayerAddMount(cid, mountid)
		setPlayerStorageValue(cid, stor, os.time()+days*86400)
		npcHandler:say('Here is your mount '..name..', it will last until '..os.date("%d %B %Y %X", getPlayerStorageValue(cid,stor))..'.', cid)
	else
		npcHandler:say('you do not have enough money to rent the mount!', cid)
		talkState[talkUser] = 0  
	end
elseif msg == "no" then  
	selfSay("Then not", cid)  
	talkState[talkUser] = 0  
	npcHandler:releaseFocus(cid)  
end
 
local travelNode = keywordHandler:addKeyword({'palomino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Palomino for 125 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 125, destination = {x=32449, y=32226, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
return TRUE
end	
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())