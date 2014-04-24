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
	local player = Player(cid)
	
	--Stampor (Mount)
	if (msgcontains(msg, "stampor")) then
		if player:hasMount(11) then
		npcHandler:say("You alread have a Stampor as Mount!", cid)
		else
		npcHandler:say("Do you have 30 Hollow Stampor Hoof, 50 Stampor Horn and 100 Stampor Talons?", cid)
		talkState[talkUser] = 10
		end
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 10) then
		if player:removeItem(13301,30) and player:removeItem(13299,50) and player:removeItem(13300,100) then
			npcHandler:say("Take this Stampor as Mount!", cid)
			player:addMount(11)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			talkState[talkUser] = 0
		else
			npcHandler:say("You dont have these items!", cid)	
			talkState[talkUser] = 0
		end
	end
	
	
	if(msgcontains(msg, "wooden stake")) then
		if(player:getStorageValue(87) == 12 and talkState[talkUser] < 1) then
			if(player:getStorageValue(5941) >= 1) then
				if(player:getStorageValue(88) + 7 * 24 * 60 * 60 < os.time()) then
					npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a wooden stake, I'll bless it for you. <chuckles>", cid)
					talkState[talkUser] = 1
				else
					npcHandler:say("Sorry I'm still exhausted from the last ritual. come back later and try again.", cid)
					talkState[talkUser] = 0
				end
			end
		elseif(talkState[talkUser] == 1) then
			if(player:getStorageValue(5941) >= 1) then
				npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
				talkState[talkUser] = 2
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			if(player:getStorageValue(5941) >= 1) then
				player:setStorageValue(88, os.time())
				npcHandler:say("<mumblemumble> Sha Kesh Mar!", cid)
				player:removeItem(5941, 1)
				player:addItem(5942, 1)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())