local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "promot") then
		npcHandler:say("Do you want to be promoted in your vocation for 20000 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getStorageValue(30018) == 1 then
				npcHandler:say('You are already promoted.', cid)
			elseif player:getLevel() < 20 then
				npcHandler:say('You need to be at least level 20 in order to be promoted.', cid)
			elseif player:getMoney() < 20000 then
				npcHandler:say('You do not have enough money.', cid)
			elseif configManager.getBoolean(configKeys.FREE_PREMIUM) or isPremium(cid) == true then
				npcHandler:say("Congratulations! You are now promoted.", cid)
				local promotedVoc = getPromotedVocation(player:getVocation():getId())
				player:setVocation(promotedVoc)
				player:removeMoney(20000)
			else
				npcHandler:say("You need a premium account in order to promote.", cid)
			end
		elseif npcHandler.topic[cid] == 3 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 1)
			npcHandler:say(
			{
			"Splendid! My son Rehon set off on an expedition to the deeper mines. He and a group of dwarfs were to search for new veins of crystal. Unfortunately they have been missing for 2 weeks now. ..."
			"Find my son and if he's alive bring him back. You will find a reactivated ore wagon tunnel at the entrance of the great citadel which leades to the deeper mines. If you encounter problems within the tunnel go ask Xorlosh, he can help you."
			}, cid)
		elseif npcHandler.topic[cid] == 4 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 6)
			player:addItem(2504, 1)
			npcHandler:say("Look at these dwarven legs. They were forged years ago by a dwarf who was rather tall for our kind. I want you to have them. Thank you for rescuing my son Player.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok, whatever.', cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "nokmir") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 then
			npcHandler:say("Oh well, I liked Nokmir. He used to be a good dwarf until that day on which he stole the ring from Rerun.", cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 4 then
			npcHandler:say(
			{
			"Interesting. The fact that you have the ring means that Nokmir can't have stolen it. Combined with the information Grombur gave you, the case appears in a completely different light. ..."
			"Let there be justice for all. Nokmir is innocent and acquitted from all charges! And Rerun... I want him in prison for this malicious act!"
			}, cid)
			player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 5)
			player:removeItem(14348, 1)
		end
	elseif msgcontains(msg, "Grombur") then
		if npcHandler.topic[cid] == 2 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 2)
			npcHandler:say("He's very ambitious and always volunteers for the long shifts.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) > 1 and player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 5 then
			npcHandler:say("As you have proven yourself trustworthy I'm going to assign you a special mission. Are you interested?", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 5 then
			npcHandler:say("My son was captured by trolls? Doesn't sound like him, but if you say so. Now you want a reward, huh? ...", cid)
			npcHandler.topic[cid] = 4
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
