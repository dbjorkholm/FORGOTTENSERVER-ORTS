local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Aluguel_mounts = {
	["brown rented horse"] = {price = 500, days = 1, mountid = 22, level = 10, premium = false, storage = 50561},
	["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 10, premium = false, storage = 50562}
}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	if msgcontains(msg, "transport") then
		npcHandler:say("We can bring you to Venore with one of our coaches for 125 gold. Are you interested?", player)
		npcHandler.topic[cid] = 5
	elseif(msgcontains(msg, 'yes') and npcHandler.topic[cid] == 5) then
		if player:getMoney() >= 125 then
			player:removeMoney(125)
			npcHandler:say("Have a nice trip!", player)
			local port = {x = 32850, y = 32124, z = 7}
			player:teleportTo(port)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don't have enough money.", player)
		end
	end
	local msg = string.lower(msg)
	if isInArray({"rent", "mounts", "mount", "horses"}, msg) then
		selfSay("You can buy {brown rented horse} and {grey rented horse}!", cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if Aluguel_mounts[msg] then
			if Aluguel_mounts[msg].premium == true and not isPremium(cid) then
				selfSay('You need to be premium to rent this mount.', cid) return true
			elseif player:getLevel() < Aluguel_mounts[msg].level then
				selfSay('You need level ' .. Aluguel_mounts[msg].level .. ' or more to rent this mount.', cid) return true
			elseif player:getStorageValue(Aluguel_mounts[msg].storage) >= os.time() then
				selfSay('you already have rented this mount!', cid) return true
			end
			
			name, price, stor, days, mountid = msg, Aluguel_mounts[msg].price, Aluguel_mounts[msg].storage, Aluguel_mounts[msg].days, Aluguel_mounts[msg].mountid
			selfSay('Do you want to '..name..' for '..days..' day'..(days > 1 and 's' or '')..' the price '..price..' gps?', cid)
			npcHandler.topic[cid] = 2
		else
			selfSay('Sorry, I do not rent this mount.', cid)
		end
	elseif(msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2) then
		if player:removeMoney(price) then
			player:addMount(mountid)
			player:setStorageValue(stor, os.time()+days*86400)
			selfSay('Here is your '..name..', it will last until '..os.date("%d %B %Y %X", player:getStorageValue(stor))..'.', cid)
		else
			selfSay('You do not have enough money to rent the mount!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		selfSay("Then not", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
