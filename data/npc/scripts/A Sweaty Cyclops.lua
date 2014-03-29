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

	if (msgcontains(msg, "melt")) then
		npcHandler:say("Can melt gold ingot for lil' one. You want?", cid)
		talkState[talkUser] = 10
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 10) then
		if doPlayerRemoveItem(cid, 9971,1) then
			npcHandler:say("whoooosh There!", cid)
			doPlayerAddItem(cid, 13941, 1)
			talkState[talkUser] = 0
		else
			npcHandler:say("There is no gold ingot with you.", cid)	
			talkState[talkUser] = 0
		end
	end

	if(msgcontains(msg, "amulet")) then
		if(getPlayerStorageValue(cid, 49) < 1) then
			npcHandler:say("Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil' time to make it unbroken. Yes or no??", cid)
			talkState[talkUser] = 9
		elseif(getPlayerStorageValue(cid, 49) == 1) then
			if(getPlayerStorageValue(cid, 48) + 24 * 60 * 60 < os.time()) then
				npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 8266, 1)
				setPlayerStorageValue(cid, 49, 2)
			else
				npcHandler:say("Me need more time!!!", cid)
				talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Wait. Me work no cheap is. Do favour for me first, yes?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Me need gift for woman. We dance, so me want to give her bast skirt. But she big is. So I need many to make big one. Bring three okay? Me wait.", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 79, 1)
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 3983) >= 3) then
				doPlayerRemoveItem(cid, 3983, 3)
				npcHandler:say("Good good! Woman happy will be. Now me happy too and help you.", cid)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, 79, 2)
			end
		-- Crown Armor
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 2487) >= 1) then
				doPlayerRemoveItem(cid, 2487, 1)
				npcHandler:say("Cling clang! ", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 5887, 1)
			end	
		-- Dragon Shield
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 2516) >= 1) then
				doPlayerRemoveItem(cid, 2516, 1)
				npcHandler:say("Cling clang! ", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 5889, 1)
			end	
		-- Devil Helmet	
		elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid, 2462) >= 1) then
				doPlayerRemoveItem(cid, 2462, 1)
				npcHandler:say("Cling clang! ", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 5888, 1)
			end	
		-- Giant Sword	
		elseif(talkState[talkUser] == 7) then
			if(getPlayerItemCount(cid, 2393) >= 1) then
				doPlayerRemoveItem(cid, 2393, 1)
				npcHandler:say("Cling clang! ", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 5892, 1)
			end	
		-- Soul Orb
		elseif(talkState[talkUser] == 8) then
			if(getPlayerItemCount(cid, 5944) >= 1) then
				doPlayerAddItem(cid, 6529, getPlayerItemCount(cid, 5944) * 3)
				doPlayerRemoveItem(cid, 5944, getPlayerItemCount(cid, 5944))
				npcHandler:say("Cling clang! ", cid)
				talkState[talkUser] = 0
			end	
		elseif(talkState[talkUser] == 9) then
			if(getPlayerItemCount(cid, 8262) >= 1 and getPlayerItemCount(cid, 8263) >= 1 and getPlayerItemCount(cid, 8264) >= 1 and getPlayerItemCount(cid, 8265) >= 1 and getPlayerMoney(cid) >= 5000) then
				doPlayerRemoveItem(cid, 8262, 1)
				doPlayerRemoveItem(cid, 8263, 1)
				doPlayerRemoveItem(cid, 8264, 1)
				doPlayerRemoveItem(cid, 8265, 1)
				doPlayerRemoveMoney(cid, 5000)
				setPlayerStorageValue(cid, 48, os.time())
				setPlayerStorageValue(cid, 49, 1)
				npcHandler:say("Well, well, I do that! Big Ben makes lil' amulet unbroken with big hammer in big hands! No worry! Come back after sun hits the horizon 24 times and ask me for amulet.", cid)
				talkState[talkUser] = 0
			end	
		end
	
	
	-- Crown Armor
	elseif(msg == "uth'kean") then
		if(getPlayerStorageValue(cid, 79) < 1) then
			npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 79) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 79) == 2) then
			npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", cid)
			talkState[talkUser] = 4
		end
	-- Dragon Shield
	elseif(msg == "uth'lokr") then
		if(getPlayerStorageValue(cid, 79) < 1) then
			npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 79) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 79) == 2) then
			npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
			talkState[talkUser] = 5
		end
	-- Devil Helmet
	elseif(msg == "za'ralator") then
		if(getPlayerStorageValue(cid, 79) < 1) then
			npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 79) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 79) == 2) then
			npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", cid)
			talkState[talkUser] = 6
		end
	-- Giant Sword
	elseif(msg == "uth'prta") then
		if(getPlayerStorageValue(cid, 79) < 1) then
			npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 79) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 79) == 2) then
			npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", cid)
			talkState[talkUser] = 7
		end
	-- Soul Orb
	elseif(msgcontains(msg, "soul orb")) then
		if(getPlayerStorageValue(cid, 79) < 1) then
			npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 79) == 1) then
			npcHandler:say("Lil' one bring three bast skirts?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 79) == 2) then
			npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", cid)
			talkState[talkUser] = 8
		end		
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())