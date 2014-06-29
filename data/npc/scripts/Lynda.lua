local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "angelina") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) == 1 then
			npcHandler:say({"Angelina had been imprisoned? My, these are horrible news, but I am so glad to hear that she is safe now. ...",
							"I will happily carry out her wish and reward you, but I fear I need some important ingredients for my blessing spell first....",
							"Will you gather them for me?"}, cid, 0, 1, 4000)			
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "wand") or msgcontains(msg, "rod") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) == 2 then
			npcHandler:say("Did you bring a sample of each wand and each rod with you?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "sulphur") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) == 3 then
			npcHandler:say("Did you obtain 10 ounces of magic sulphur?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "soul stone") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) == 4 then
			npcHandler:say("Were you actually able to retrieve the Necromancer's soul stone?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "ankh") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerWandAddon) == 5 then
			npcHandler:say("Am I sensing enough holy energy from ankhs here?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say({"Thank you, I promise that your efforts won't be in vain! Listen closely now: First, I need a sample of five druid rods and five sorcerer wands. ...",
							"I need a snakebite rod, a moonlight rod, a necrotic rod, a terra rod and a hailstorm rod. Then, I need a wand of vortex, a wand of dragonbreath ...",
							"... a wand of decay, a wand of cosmic energy and a wand of inferno. Please bring them all at once so that their energy will be balanced. ...",
							"Secondly, I need 10 ounces of magic sulphur. It can absorb the elemental energy of all the wands and rods and bind it to something else. ...",
							"Next, I will need a soul stone. These can be used as a vessel for energy, evil as well as good. They are rarely used nowaday though. ...",
							"Lastly, I need a lot of holy energy. I can extract it from ankhs, but only a small amount each time. I will need about 20 ankhs. ...",
							"Did you understand everything I told you and will help me with my blessing?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then	
			npcHandler:say("Alright then. Come back to with a sample of all five wands and five rods, please.", cid)
			player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 2)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if  player:getItemCount(2181) >= 1 and player:getItemCount(2182) >= 1 and player:getItemCount(2183) >= 1 and player:getItemCount(2185) >= 1 and player:getItemCount(2186) >= 1 and player:getItemCount(2187) >= 1 and player:getItemCount(2188) >= 1 and player:getItemCount(2189) >= 1 and player:getItemCount(2190) >= 1 and player:getItemCount(2191) >= 1 then
			-- if  player:getItemCount(wandrod) >= 1 then
				local wandrod = {2181, 2182, 2183, 2185, 2186, 2187, 2188, 2189, 2190, 2191}
				npcHandler:say("Thank you, that must have been a lot to carry. Now, please bring me 10 ounces of magic sulphur.", cid)
				player:removeItem(2181, 1)
				player:removeItem(2182, 1)
				player:removeItem(2183, 1)
				player:removeItem(2185, 1)
				player:removeItem(2186, 1)
				player:removeItem(2187, 1)
				player:removeItem(2188, 1)
				player:removeItem(2189, 1)
				player:removeItem(2190, 1)
				player:removeItem(2191, 1)
				player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(5904) >= 10 then
				npcHandler:say("Very good. I will immediately start to prepare the ritual and extract the elemental energy from the wands and rods. Please bring me the Necromancer's soul stone now.", cid)
				player:removeItem(5904, 10)
				player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 4)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount(5809) >= 1 then
				npcHandler:say("You have found a rarity there, " .. player:getName() .. ". This will become the tip of your blessed wand. Please bring me 20 ankhs now to complete the ritual.", cid)
				player:removeItem(5809, 1)
				player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 5)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getItemCount(2193) >= 20 then
				npcHandler:say("The ingredients for the ritual are complete! I will start to prepare your blessed wand,... I'm glad to tell you that I have finished the ritual, " .. player:getName() .. ". Here is your new wand. I hope you carry it proudly for everyone to see.", cid)
				player:removeItem(2193, 20)
				player:setStorageValue(Storage.OutfitQuest.MageSummonerWandAddon, 6)
				player:addOutfitAddon(141, 1)
				player:addOutfitAddon(130, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0	
			end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
