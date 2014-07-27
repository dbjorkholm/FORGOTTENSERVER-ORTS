local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local fire = Condition(CONDITION_FIRE)
fire:setParameter(CONDITION_PARAM_DELAYED, true)
fire:setParameter(CONDITION_PARAM_FORCEUPDATE, true)
fire:addDamage(25, 9000, -10)
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'gamel') and msgcontains(msg, 'rebel') then
		npcHandler:say('Are you saying that Gamel is a member of the rebellion?', cid)
		npcHandler.npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'no') then
			npcHandler:say('Then don't bother me with it. I'm a busy man.', cid)
			npcHandler.topic[cid] = nil
		elseif msgcontains(msg, 'yes') then
			npcHandler:say('Do you know what his plans are about?', cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'magic') and msgcontains(msg, 'crystal') and msgcontains(msg, 'lugri') and msgcontains(msg, 'deathcurse') then
			npcHandler:say('That\'s terrible! Will you give me the crystal?', cid)
			npcHandler.topic[cid] = 3
		else
			npcHandler:say('Tell me precisely what he asked you to do! It\'s important!', cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, 'no') then
			npcHandler:say('Traitor!', cid)
			local player = Player(cid)
			player:addCondition(fire)
			player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
			Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			player:removeItem(2177, 1)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		elseif msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2177, 1) then
				npcHandler:say('Thank you! Take this ring. If you ever need a healing, come, bring the scroll, and ask me to {heal}.', cid)
				player:addItem(2168, 1)
			else
				npcHandler:say('Sorry, but you have none.', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'heal') then
		npcHandler:say('Do you need the healing now?', cid)
		npcHandler.topic[cid] = 4
	elseif npcHandler.topic[cid] == 4 then
		if msgcontains(msg, 'no') then
			npcHandler:say('As you wish.', cid)
		elseif msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2168, 1) then
				npcHandler:say('So be healed!', cid)
				player:addHealth(player:getMaxHealth())
				Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say('Sorry, you are not worthy!', cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())