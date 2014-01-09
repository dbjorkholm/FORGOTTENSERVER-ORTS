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

local buyList = 
{
	{itemId = 2532, price = 5000}, -- Ancient Shield
	{itemId = 2489, price = 1500}, -- Dark Armor
	{itemId = 2490, price = 1000}, -- Dark Helmet
	{itemId = 2396, price = 5000}, -- Ice Rapier
}
local sellList = 
{
	{itemId = 2532, price = 900}, -- Ancient Shield
	{itemId = 2529, price = 800}, -- Black Shield
	{itemId = 7428, price = 10000}, -- Bonebreaker
	{itemId = 2489, price = 400}, -- Dark Armor
	{itemId = 2490, price = 250}, -- Dark Helmet
	{itemId = 2434, price = 2000}, -- Dragon Hammer
	{itemId = 7419, price = 15000}, -- Dreaded Cleaver
	{itemId = 7860, price = 2000}, -- Earth Knight Axe
	{itemId = 7875, price = 2000}, -- Energy Knight Axe
	{itemId = 7750, price = 2000}, -- Fiery Knight Axe
	{itemId = 2393, price = 17000}, -- Giant Sword
	{itemId = 7407, price = 8000}, -- Haunted Blade
	{itemId = 7769, price = 2000}, -- Icy Knight Axe
	{itemId = 2476, price = 5000}, -- Knight Armor
	{itemId = 2430, price = 2000}, -- Knight Axe
	{itemId = 2477, price = 5000}, -- Knight Legs
	{itemId = 2663, price = 150}, -- Mystic Turban
	{itemId = 7421, price = 22000}, -- Onyx Flail
	{itemId = 7411, price = 20000}, -- Ornamented Axe
	{itemId = 2411, price = 50}, -- Poison Dagger
	{itemId = 2409, price = 900}, -- Serpent Sword
	{itemId = 2436, price = 6000}, -- Skull Staff
	{itemId = 2479, price = 500}, -- Strange Helmet
	{itemId = 7413, price = 4000}, -- Titan Axe
	{itemId = 2528, price = 8000}, -- Tower Shield
	{itemId = 2534, price = 15000}, -- Vampire Shield
	{itemId = 2475, price = 5000}, -- Warrior Helmet
}

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- GREET
	if(msg == "DJANNI'HAH") then
		if(getPlayerStorageValue(cid, 80) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, 82) < 1) then
				npcHandler:say("What do you want from me, " .. getCreatureName(cid) .."?", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- Mission 2 - The Tear of Daraman
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 81) == 5) then
			npcHandler:say({"So Baa'leal thinks you are up to do a mission for us? ...", "I think he is getting old, entrusting human scum such as you are with an important mission like that. ...", "Personally, I don't understand why you haven't been slaughtered right at the gates. ...", "Anyway. Are you prepared to embark on a dangerous mission for us?"}, cid, 0, 1, 3500)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 81) == 7) then
			npcHandler:say("Did you find the tear of Daraman?", cid)
			talkState[talkUser] = 2
		end
	-- Mission 2 - The Tear of Daraman
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"All right then, human. Have you ever heard of the {'Tears of Daraman'}? ...", "They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...", "If you want to learn more about these gemstones don't forget to visit our library. ...", "Anyway, one of them is enough to create thousands of our mighty djinn blades. ...", "Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...", "To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...", "Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...", "Needless to say, the Marid won't be too eager to part with it. Try not to get killed until you have delivered the stone to me."}, cid, 0, 1, 4500)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 81, 6)
		elseif(talkState[talkUser] == 2) then
			if(doPlayerRemoveItem(cid, 2346, 1)) then
				npcHandler:say({"So you have made it? You have really managed to steal a Tear of Daraman? ...", "Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...", "Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...", "Baa'leal, wants you to talk to Malor concerning some new mission. ...", "Looks like you have managed to extended your life expectancy - for just a bit longer."}, cid, 0, 1, 4000)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, 81, 8)
			end
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)