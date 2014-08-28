local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		if msg == 'hi' then
			npcHandler:say('MIND YOUR MANNERS COMMONER! To address the king greet with his title!!', cid)
		elseif msg == 'hail king' or msg == 'salutations king' then
			npcHandler:say('HAIL TO THE KING!.', cid)
			npcHandler:addFocus(cid)
		end
	end

	if not npcHandler:isFocused(cid) then
		return false
	end

	if isInArray({'fuck', 'idiot', 'asshole', 'ass', 'fag', 'stupid', 'tyrant', 'shit', 'lunatic'}, msg) then
		local player = Player(cid)
		local conditions = { CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED }
		for i = 1, #conditions do
			if player:getCondition(conditions[i]) then
				player:removeCondition(conditions[i])
			end
		end
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addHealth(1 - player:getHealth())
		selfSay('Take this!', cid)
		Npc():getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	elseif msgcontains(msg, 'bye') or msgcontains(msg, 'farewell') then
		npcHandler:say('LONG LIVE THE KING! You may leave now!', cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'LONG LIVE THE KING!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
