local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local rent_mounts = {
	["brown rented horse"] = {price = 500, days = 1, mountid = 22, level = 10, storage = 50561},
	["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 10, storage = 50562}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "transport") then
		npcHandler:say("We can bring you to Thais with one of our coaches for 125 gold. Are you interested?", cid)
		npcHandler.topic[cid] = 5
	elseif(msgcontains(msg, 'yes') and npcHandler.topic[cid] == 5) then
		if player:getMoney() >= 125 then
			player:removeMoney(125)
			npcHandler:say("Have a nice trip!", cid)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32449, 32226, 7), false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don't have enough money.", cid)
		end
	end

	local msg = string.lower(msg)

	if isInArray({"rent", "mounts", "mount", "horses"}, msg) then
		selfSay("You can buy {brown rented horse} and {grey rented horse}!", cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if rent_mounts[msg] then
			if player:getLevel() < rent_mounts[msg].level then
				selfSay('You need level ' .. rent_mounts[msg].level .. ' or more to rent this mount.', cid) return true
			elseif player:getStorageValue(rent_mounts[msg].storage) >= os.time() then
				selfSay('You already have rented this mount!', cid) return true
			end

			name, price, stor, days, mountid = msg, rent_mounts[msg].price, rent_mounts[msg].storage, rent_mounts[msg].days, rent_mounts[msg].mountid
			selfSay('Do you want a '..name..' for '..days..' day'..(days > 1 and 's' or '')..' the price '..price..' gold coins?', cid)
			npcHandler.topic[cid] = 2
		else
			selfSay('Sorry, I do not rent this mount.', cid)
		end
	elseif(msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2) then
		if player:removeMoney(price) then
			player:addMount(mountid)
			player:setStorageValue(stor, os.time() + days * 86400)
			selfSay('Here is your '..name..', it will last until '..os.date("%d %B %Y %X", getPlayerStorageValue(cid,stor))..'.', cid)
		else
			selfSay('You do not have enough money to rent the mount!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		selfSay("Then not.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
