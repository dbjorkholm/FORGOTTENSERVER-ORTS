local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	
	if isInArray({"heal", "help"}, msg) then
		if player:getHealth() < 50 then
			player:addHealth(50 - player:getHealth())
			local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED}
			for i = 1, #conditions do
				if player:getCondition(conditions[i], CONDITIONID_COMBAT) then
					player:removeCondition(conditions[i], CONDITIONID_COMBAT)
				end
			end
			npcHandler:say("You are hurt, my child. I will heal your wounds.", cid)
		else
			npcHandler:say("You aren't looking that bad. Sorry, I can't help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes.", cid)
		end
	elseif msgcontains(msg, "spiritual") then
		npcHandler:say("Here in the whiteflower temple you may receive the blessing of spiritual shielding. But we must ask of you to sacrifice " .. getBlessingsCost(player:getLevel()) .. " gold. Are you still interested?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if not player:hasBlessing(1) then
			if player:removeMoney(getBlessingsCost(player:getLevel())) then
				player:addBlessing(1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("So receive the shielding of your spirit, pilgrim.", cid)
			else
				npcHandler:say("Oh. You do not have enough money.", cid)
			end
		else
			npcHandler:say("You already possess this blessing.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Ok. Suits me.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am here to provide one of the five {blessings}.'})
keywordHandler:addKeyword({'blessings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here.'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The druids north of Carlin will provide you with the embrace of Tibia.'})
keywordHandler:addKeyword({'suns'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You can ask for the blessing of the two suns in the suntower near Ab\'Dendriel.'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Talk to the hermit Eremo on the isle of Cormaya about this blessing.'})

npcHandler:setMessage(MESSAGE_GREET, "Welcome, pilgrim. How may I {help} you? Are you in need of {healing}?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
