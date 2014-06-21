local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local ticketPrice = 50
local exhibitionPosition = Position(32390, 32195, 8)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'yes') then
		local player = Player(cid)
		if player and player:removeMoney(ticketPrice) then
			selfSay('And here we go!', cid)
			player:teleportTo(exhibitionPosition)
			exhibitionPosition:sendMagicEffect(CONST_ME_TELEPORT)
		else
			selfSay('The exhibition is not for free. You have to pay 50 Gold to get in. Next please!', cid)
		end
	else
		selfSay('Then not.', cid)
	end
	npcHandler:releaseFocus(cid)
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())