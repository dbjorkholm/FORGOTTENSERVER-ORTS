local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storageMain = 10000
local storageKill = 10001
local greetMsg = {
	"...if the expected constant is higher than... Hmmm, who are you?? What do you want?",
	"...then I could transform a spell to bend... How can anyone expect me to work under these conditions?? What do you want?",
	"...if my calculations are correct, I will be able to revive... Arrgghh!! What do you want?"
}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, greetMsg[math.random(#greetMsg)])
	Topic[cid] = 0
	return true
end
 
local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "job") then
		npcHandler:say("How dare you asking me this?!? I'm Arkulius - Master of Elements, the HEADMASTER of this academy!!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "name") then
		npcHandler:say("I'm Arkulius - Master of Elements, the headmaster of this academy.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "help") then
		npcHandler:say("I have better things to do than helping you. See that ice statue over there? My dear friend Alverus needs to be revived!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "time") then
		npcHandler:say("Time is an illusion and completely irrelevant to me.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "weapon") then
		npcHandler:say("Weapons are for those people who aren't able to use their heads or better what's INSIDE their heads. No offence <coughs>.", cid) -- < Knight; FIXME !!!
		Topic[cid] = 0
	elseif msgcontains(msg, "pits") and msgcontains(msg, "of") and msgcontains(msg, "inferno") then
		npcHandler:say("Yeye, I believe you almost feel like home among all those brainless creatures!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "alverus") then
		npcHandler:say({"It happened while he carried out an experiment concerning the creation of the elemental {shrines}. I still get goose bumps just by thinking of it. ...", "You need to know about the process of creating an elemental shrine to understand it completely, but I don't want to go into detail now. ...", "Anyway, his spell had a different outcome than he had planned. He accidentally created an Ice Overlord, pure living elemental ice, who froze him in a blink of an eye."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "shrine") then
		npcHandler:say({"The creation of the elemental shrines is a really complex matter. They are actually nodes, locations where the matching elemental sphere is very close. ...", "The shrine itself is like a portal between our world and the elemental {sphere} and enables us to use the elemental energy emerging from it."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "sphere") and getPlayerLevel(cid) >= 80 then
		npcHandler:say({"There are four spheres we know of: ice, fire, earth and energy. ....<mumbles> Hmmm, should I ask or not?....The heck with it! Now that you know about the spheres ...", "I found a way to visit them. It's VERY dangerous and there is a decent chance that you won't come back BUT if you succeed you'll write history!!! Ask me about that {mission} if you're interested."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "mission") or msgcontains(msg, "quest") then
		local v = getPlayerStorageValue(cid, storageMain)
		if v < 1 then
			if getPlayerLevel(cid) >= 80 then
				if isSorcerer(cid) then
					npcHandler:say({"Okay, listen closely: First of all, you need to gather 20 enchanted rubies in order to go to the fire sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", "Once you got there, find a way to gather elemental fire in any form. You will face fire elementals, that's for sure, but I don't know how the fire is stored. ...", "Anyway, there should be a way to use that elemental fire and strengthen one of the elementals. If my calculations are right, you will create a Fire Overlord who hopefully will consist of some sort of 'concentrated' fire or something similar. ...", "THAT'S what we need!! Are you in on it?"}, cid, 0, 1, 4000)
				elseif isDruid(cid) then
					npcHandler:say({"Okay, listen closely: First of all, you need to gather 20 enchanted emeralds in order to go to the earth sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", "Once you got there, find a way to gather elemental earth in any form. You will face earth elementals, that's for sure, but I don't know how the earth is stored. ...", "Anyway, there should be a way to use that elemental earth and strengthen one of the elementals. If my calculations are right, you will create an Earth Overlord who hopefully will consist of some sort of 'concentrated' earth or something similar. ...", "THAT'S what we need!! Are you in on it?"}, cid, 0, 1, 4000)
				elseif isPaladin(cid) then
					npcHandler:say({"Okay, listen closely: First of all, you need to gather 20 enchanted sapphires in order to go to the ice sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", "Once you got there, find a way to gather elemental ice in any form. You will face ice elementals, that's for sure, but I don't know how the ice is stored. ...", "Anyway, there should be a way to use that elemental ice and strengthen one of the elementals. If my calculations are right, you will create an Ice Overlord who hopefully will consist of some sort of 'concentrated' ice or something similar. ...", "THAT'S what we need!! Are you in on it?"}, cid, 0, 1, 4000)
				elseif isKnight(cid) then
					npcHandler:say({"Okay, listen closely: First of all, you need to gather 20 enchanted amethysts in order to go to the energy sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", "Once you got there, find a way to gather elemental energy in any form. You will face energy elementals, that's for sure, but I don't know how the energy is stored. ...", "Anyway, there should be a way to use that energy and strengthen one of the elementals. If my calculations are right, you will create an Energy Overlord who hopefully will consist of some sort of 'concentrated' energy. ...", "THAT'S what we need!! Are you in on it?"}, cid, 0, 1, 4000)
				end
			else
				npcHandler:say("I'm sorry this task is highly dangerous and I need experienced people for it.", cid)
				Topic[cid] = 0
				return
			end
			Topic[cid] = 1
		elseif v == 1 then
			if getPlayerItemCount(cid, isSorcerer(cid) and 8304 or isDruid(cid) and 8305 or isPaladin(cid) and 8300 or isKnight(cid) and 8306) > 0 then
				setPlayerStorageValue(cid, storageMain, 2)
				npcHandler:say({"Impressive!! Let me take a look.......Ahh, " .. (isSorcerer(cid) and "an ETERNAL FLAME! Now you need to find a knight, a druid, and a paladin who also completed this first task. ..." or isDruid(cid) and "MOTHER SOIL! Now you need to find a knight, a paladin, and a sorcerer who also completed this first task. ..." or isPaladin(cid) and "a FLAWLESS ICE CRYSTAL! Now you need to find a knight, a druid, and a sorcerer who also completed this first task. ..." or isKnight(cid) and "PURE ENERGY! Now you need to find a druid, a paladin, and a sorcerer who also completed this first task. ..."), "Go down in the cellar again. I prepared a room under the academy where it should be safe. Your task is to charge the machines with the elemental substances and summon the LORD OF THE ELEMENTS. ...", "When you use an obsidian knife on it's corpse you hopefully get some of the precious neutral matter. It's the only way to revive my dear friend Alverus!!"}, cid, 0, 1, 4500)
			else
				npcHandler:say("You need some kind of pure elemental soil from the " .. (isSorcerer(cid) and "Fire" or isDruid(cid) and "Earth" or isPaladin(cid) and "Ice" or isKnight(cid) and "Energy") .. " Overlord. Come back when you've got it.", cid)
			end
			Topic[cid] = 0
		elseif v == 2 then
			if doPlayerRemoveItem(cid, 8310, 1) == TRUE then
				npcHandler:say("AMAZING!! I'm going to start immediately with the research. If it turns out the way I expect it, Alverus will be revived soon!! Here, take this as a reward and try to collect more of this substance. I'll make you a good offer, I promise. ", cid)
				doPlayerAddItem(cid, isSorcerer(cid) and 8867 or isDruid(cid) and 8869 or isPaladin(cid) and 8853 or isKnight(cid) and 8883, 1)
				setPlayerStorageValue(cid, storageMain, 3)
				setPlayerStorageValue(cid, 10029, 1)
			end
		end
	elseif Topic[cid] == 1 and msgcontains(msg, "yes") then
		setPlayerStorageValue(cid, storageMain, 1)
		npcHandler:say("Good, don't waste time! Come back here when you have the elemental object!", cid)
		Topic[cid] = 0
	end
	return TRUE
end
 
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and please stay away, okay?")
npcHandler:setMessage(MESSAGE_FAREWELL, "At last! Good things come to those who wait.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())