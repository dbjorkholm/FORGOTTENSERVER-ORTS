dofile('data/lib/MissionSelect.lua')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "piece of draconian steel")) then
		npcHandler:say("You bringing me draconian steel and obsidian lance in exchange for obsidian knife?", cid)
		talkState[talkUser] = 15
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 15) then
		if (getPlayerItemCount(cid, 5889) >= 1 and getPlayerItemCount(cid, 2425) >= 1) then
			local p = Player(cid)
			npcHandler:say("Here you have it.", cid)
			p:removeItem(5889, 1)
			p:removeItem(2425, 1)
			p:addItem(5908, 1)
			talkState[talkUser] = 0
		else
			npcHandler:say("You dont have these items.", cid)	
			talkState[talkUser] = 0
		end
	end
 
	if(msgcontains(msg, "pickaxe")) then
		if(getPlayerStorageValue(cid, 90) == 1) then
			npcHandler:say("True dwarven pickaxes having to be maded by true weaponsmith! You wanting to get pickaxe for explorer society?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "crimson sword")) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart + 4) == 1) then
			npcHandler:say("Me don't sell crimson sword.", cid)
			talkState[talkUser] = 5
		end
	elseif(msgcontains(msg, "forge")) then
		if(talkState[talkUser] == 5) then
			npcHandler:say("You telling me to forge one?! Especially for you? You making fun of me?", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "brooch")) then
		if(getPlayerStorageValue(cid, 90) == 2) then
			npcHandler:say("True dwarven pickaxes having to be maded by true weaponsmith! You wanting to get pickaxe for explorer society?", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Me order book quite full is. But telling you what: You getting me something me lost and Uzgod seeing that your pickaxe comes first. Jawoll! You interested?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Good good. You listening: Me was stolen valuable heirloom. Brooch from my family. Good thing is criminal was caught. Bad thing is, criminal now in dwarven prison of dwacatra is and must have taken brooch with him ...", cid)
			npcHandler:say("To get into dwacatra you having to get several keys. Each key opening way to other key until you get key to dwarven prison ...", cid)
			npcHandler:say("Last key should be in the generals quarter near armory. Only General might have key to enter there too. But me not knowing how to enter Generals private room at barracks. You looking on your own ...", cid)
			npcHandler:say("When got key, then you going down to dwarven prison and getting me that brooch. Tell me that you got brooch when having it.", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 90, 2)
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 2318) >= 1) then
				doPlayerRemoveItem(cid, 2318, 1)
				npcHandler:say("Thanking you for brooch. Me guessing you now want your pickaxe?", cid)
				talkState[talkUser] = 4
			end
		elseif(talkState[talkUser] == 4) then
			npcHandler:say("Here you have it.", cid)
			talkState[talkUser] = 0
			doPlayerAddItem(cid, 11421, 1)
			setPlayerStorageValue(cid, 90, 3)
		elseif(talkState[talkUser] == 9) then
			if(getPlayerMoney(cid) >= 250 and getPlayerItemCount(cid, 5880) >= 3) then
				doPlayerRemoveMoney(cid, 250)
				doPlayerRemoveItem(cid, 5880, 3)
				npcHandler:say("Ah, that's how me like me customers. Ok, me do this... <pling pling> ... another fine swing of the hammer here and there... <ploing>... here you have it!", cid)
				talkState[talkUser] = 0
				doPlayerAddItem(cid, 7385, 1)
				setPlayerStorageValue(cid, Rashid.MissionStart + 4, 2)
			end
		end
	elseif(msgcontains(msg, "no")) then
		if(talkState[talkUser] == 6) then
			npcHandler:say("Well. Thinking about it, me a smith, so why not. 1000 gold for your personal crimson sword. Ok?", cid)
			talkState[talkUser] = 7
		elseif(talkState[talkUser] == 7) then
			npcHandler:say("Too expensive?! You think me work is cheap? Well, if you want cheap, I can make cheap. Hrmpf. I make cheap sword for 300 gold. Ok?", cid)
			talkState[talkUser] = 8
		elseif(talkState[talkUser] == 8) then
			npcHandler:say("Cheap but good quality? Impossible. Unless... you bring material. Three iron ores, 250 gold. Okay?", cid)
			talkState[talkUser] = 9
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())