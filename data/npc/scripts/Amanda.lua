local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local blessings = 0
	for i = 1, 5 do
		if player:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	
	local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED}
		
	if msgcontains(msg, "heal") then
		if player:getHealth() < 50 then
			player:addHealth(50 - player:getHealth())
			for i = 1, #conditions do
				if player:getCondition(conditions[i], CONDITIONID_COMBAT) then
					player:removeCondition(conditions[i], CONDITIONID_COMBAT)
				end
			end
			npcHandler:say("You are hurt, my child. I will heal your wounds.", cid)
		else
			npcHandler:say("You aren't looking that bad. Sorry, I can't help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes or get the protection of the {twist of fate} here.", cid)
		end
	elseif msgcontains(msg, "pilgrimage") then
		npcHandler:say("Whenever you receive a lethal wound, your vital force is damaged and there is a chance that you lose some of your equipment. With every single of the five {blessings} you have, this damage and chance of loss will be reduced.", cid)
	elseif msgcontains(msg, "blessings") then
		npcHandler:say("There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here.", cid)
	elseif msgcontains(msg, "spiritual") then
		npcHandler:say("You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais.", cid)
	elseif msgcontains(msg, "phoenix") then
		npcHandler:say("The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.", cid)
	elseif msgcontains(msg, "embrace") then
		npcHandler:say("The druids north of Carlin will provide you with the embrace of Tibia.", cid)
	elseif msgcontains(msg, "suns") then
		npcHandler:say("You can ask for the blessing of the two suns in the suntower near Ab'Dendriel.", cid)
	elseif msgcontains(msg, "solitude") then
		npcHandler:say("Talk to the hermit Eremo on the isle of Cormaya about this blessing.", cid)
	elseif msgcontains(msg, "twist of fate") then
		npcHandler:say({"This is a special blessing I can bestow upon you once you have obtained at least one of the other blessings and which functions a bit differently. ...", "It only works when you're killed by other adventurers, which means that at least half of the damage leading to your death was caused by others, not by monsters or the environment. ...", "The {twist of fate} will not reduce the death penalty like the other blessings, but instead prevent you from losing your other blessings as well as the amulet of loss, should you wear one. It costs the same as the other blessings. ...", "Would you like to receive that protection for a sacrifice of " .. getPvpBlessingCost(player:getLevel()) .. " gold, child?"}, cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "wooden stake") then
		if player:getStorageValue(87) == 7 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if blessings >= 1 or player:getItemCount(2173) >= 1 then
				if not player:hasBlessing(6) then
					if player:removeMoney(getPvpBlessingCost(player:getLevel())) then
						player:addBlessing(6)
						npcHandler:say("So receive the protection of the twist of fate, pilgrim.", cid)
					else
						npcHandler:say("Oh. You do not have enough money.", cid)
					end
				else
					npcHandler:say("You already possess this blessing.", cid)
				end
			else
				npcHandler:say("You don't have any of the other blessings nor an amulet of loss, so it wouldn't make sense to bestow this protection on you now. Remember that it can only protect you from the loss of those!", cid)
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getItemCount(5941) >= 1 then
				player:setStorageValue(87, 8)
				npcHandler:say("So receive my prayer: 'Wicked curses shall be broken'. Now, bring your stake to Kasmir in Darashia for the next line of the prayer. I will inform him what to do. ", cid)
			end
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] >= 1 then
		npcHandler:say("Fine. You are free to decline my offer.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, young |PLAYERNAME|! If you are heavily wounded or poisoned, I can {heal} you for free.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Remember: If you are heavily wounded or poisoned, I can heal you for free.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May the gods bless you, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())