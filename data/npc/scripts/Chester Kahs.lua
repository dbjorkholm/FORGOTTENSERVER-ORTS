local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local fire = createConditionObject(CONDITION_FIRE)
setConditionParam(fire, CONDITION_PARAM_DELAYED, true)
setConditionParam(fire, CONDITION_PARAM_FORCEUPDATE, true)
addDamageCondition(fire, 25, 9000, -10)
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "gamel") and msgcontains(msg, "rebel") then
		npcHandler:say("Are you saying that Gamel is a member of the rebellion?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, "no") then
			npcHandler:say("Then don't bother me with it. I'm a busy man.", cid)
			Topic[cid] = nil
		elseif msgcontains(msg, "yes") then
			npcHandler:say("Do you know what his plans are about?", cid)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, "magic") and msgcontains(msg, "crystal") and msgcontains(msg, "lugri") and msgcontains(msg, "deathcurse") then
			npcHandler:say("That's terrible! Will you give me the crystal?", cid)
			Topic[cid] = 3
		else
			npcHandler:say("Tell me precisely what he asked you to do! It's important!", cid)
		end
	elseif Topic[cid] == 3 then
		if msgcontains(msg, "no") then
			npcHandler:say("Traitor!", cid)
			doAddCondition(cid, fire)
			doSendMagicEffect(getThingPos(cid), CONST_ME_EXPLOSIONHIT)
			doSendMagicEffect(getNpcPos(), CONST_ME_MAGIC_RED)
			doPlayerRemoveItem(cid, 2177, 1)
			Topic[cid] = nil
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		elseif msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2177, 1) then
				npcHandler:say("Thank you! Take this ring. If you ever need a healing, come, bring the scroll, and ask me to 'heal'.", cid)
				doPlayerAddItem(cid, 2168, 1)
			else
				npcHandler:say("Sorry, but you have none.", cid)
			end
			Topic[cid] = nil
		end
	elseif msgcontains(msg, "heal") then
		npcHandler:say("Do you need the healing now?", cid)
		Topic[cid] = 4
	elseif Topic[cid] == 4 then
		if msgcontains(msg, "no") then
			npcHandler:say("As you wish.", cid)
		elseif msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2168, 1) then
				npcHandler:say("So be healed!", cid)
				doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
				doSendMagicEffect(getNpcPos(), CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say("Sorry, you are not worthy!", cid)
			end
			Topic[cid] = nil
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())