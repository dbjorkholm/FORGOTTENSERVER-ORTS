--// Script NPC Rent Horse System

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

local Aluguel_mounts = {
	["brown rented horse"] = {price = 500, days = 1, mountid = 22, level = 10, premium = false, storage = 50561},
	["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 10, premium = false, storage = 50562}
}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local msg = string.lower(msg)
	if isInArray({"rent", "mounts", "mount"}, msg) then
		selfSay("You can buy {brown rented horse} and {grey rented horse}!", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 then
		if Aluguel_mounts[msg] then
			if Aluguel_mounts[msg].premium == true and not isPremium(cid) then
				selfSay('You need to be premium to rent this mount.', cid) return true
			elseif getPlayerLevel(cid) < Aluguel_mounts[msg].level then
				selfSay('You need level ' .. Aluguel_mounts[msg].level .. ' or more to rent this mount.', cid) return true
			elseif getPlayerStorageValue(cid, Aluguel_mounts[msg].storage) >= os.time() then
				selfSay('you already have rented this mount!', cid) return true
			end
			
			name, price, stor, days, mountid = msg, Aluguel_mounts[msg].price, Aluguel_mounts[msg].storage, Aluguel_mounts[msg].days, Aluguel_mounts[msg].mountid
			selfSay('Do you want to '..name..' for '..days..' day'..(days > 1 and 's' or '')..' the price '..price..' gps?', cid)
			talkState[talkUser] = 2
		else
			selfSay('Sorry, I do not rent this mount.', cid)
		end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if doPlayerRemoveMoney(cid, price) then
			doPlayerAddMount(cid, mountid)
			setPlayerStorageValue(cid, stor, os.time()+days*86400)
			selfSay('Here is your '..name..', it will last until '..os.date("%d %B %Y %X", getPlayerStorageValue(cid,stor))..'.', cid)
		else
			selfSay('You do not have enough money to rent the mount!', cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "no") then
		selfSay("Then not", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
