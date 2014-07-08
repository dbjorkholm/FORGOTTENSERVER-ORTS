local kick_time = 600

local function Kick(cid)
	if (isPlayer(cid)) then
		if (getPlayerStorageValue(cid, STORAGE_PIT) > 0) then
			doTeleportThing(cid, POSITION_KICK)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your time is out!")
			setPlayerStorageValue(cid, STORAGE_PIT, 0)  
		end
	end
	return true
end

function onStepIn(cid, item, position, fromPosition)

	local oldPit = getPlayerStorageValue(cid, STORAGE_PIT) - 1
	local newPit = getPlayerStorageValue(cid, STORAGE_PIT)
 
	local arena = getPlayerStorageValue(cid, STORAGE_ARENA)
	if (newPit < 1) then return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Something is wrong, please contact a gamemaster.") and doTeleportThing(cid, fromPosition) end
	if (newPit > 10) then
		doTeleportThing(cid, POSITION_REWARD)
		doSendMagicEffect(getCreaturePosition(cid), (arena == 1 and CONST_ME_FIREWORK_BLUE or arena == 2 and CONST_ME_FIREWORK_YELLOW or CONST_ME_FIREWORK_RED))
		setPlayerStorageValue(cid, STORAGE_PIT, 0)
		setPlayerStorageValue(cid, (arena == 1 and ACTION_GREENHORNDOOR or arena == 2 and ACTION_SCRAPPERDOOR or ACTION_WARLORDDOOR), 1)
		setPlayerStorageValue(cid, STORAGE_ARENA, getPlayerStorageValue(cid, STORAGE_ARENA) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You completed " .. ARENA[arena].name .. " arena, you should take your reward now.")
		doCreatureSay(cid, (arena == 1 and "Welcome back, little hero!" or arena == 2 and "Congratulations, brave warrior!" or "Respect and honour to you, champion!"), TALKTYPE_ORANGE_1)
		stopEvent(e10)
	return true
	end
	local thing = getCreaturesOnPit(oldPit)
	for _, uid in ipairs(thing) do
		if (getCreatureName(uid):lower() == ARENA[arena].creatures[pit]) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Defeat the monster first.")
			doTeleportThing(cid, fromPosition)
			return true
		end
	end
	thing = getCreaturesOnPit(newPit)
	local busy = false
	for _, uid in ipairs(thing) do
		if isPlayer(uid) and uid ~= cid then
			busy = true
			break
		end
	end
	if (isPlayer(getTopCreature(PITS[newPit].pillar).uid)) then
		busy = true
	end
	if (busy) then
		for _, uid in ipairs(thing) do
			if (isPlayer(uid) and uid ~= cid) then
				if (getPlayerSex(cid) == 0) then
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ""..getCreatureName(uid).." is currently in the next arena pit. You will have to wait until he leaves.")
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ""..getCreatureName(uid).." is currently in the next arena pit. You will have to wait until she leaves.")
				end
				doTeleportThing(cid, fromPosition)
			end
		end
		return true
	end
	resetPit(newPit)
	doTeleportThing(cid, PITS[newPit].center)
	doForceSummonCreature(ARENA[arena].creatures[newPit], PITS[newPit].summon)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	doCreatureSay(cid, "Fight!", TALKTYPE_ORANGE_1)
	setPlayerStorageValue(cid, 10030, 0) 
	if (getTopItem(PITS[oldPit].tp).itemid == ITEM_TELEPORT) then
		doRemoveItem(getTopItem(PITS[oldPit].tp).uid)
	end
	if (getTopItem(PITS[newPit].tp).itemid == ITEM_TELEPORT) then
		doRemoveItem(getTopItem(PITS[newPit].tp).uid)
	end
	if(getTopItem(PITS[newPit].pillar).itemid ~= ITEM_STONEPILLAR) then
		doCreateItem(ITEM_STONEPILLAR, 1, PITS[newPit].pillar)
	end
	if newPit == 2 then
		e2 = addEvent(Kick, kick_time*1000, cid)
	elseif newPit == 3 then
		e3 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e2)
	elseif newPit == 4 then
		e4 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e3)
	elseif newPit == 5 then
		e5 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e4)
	elseif newPit == 6 then
		e6 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e5)
	elseif newPit == 7 then
		e7 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e6)
	elseif newPit == 8 then
		e8 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e7)
	elseif newPit == 9 then
		e9 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e8)
	elseif newPit == 10 then
		e10 = addEvent(Kick, kick_time*1000, cid)
		stopEvent(e9)
	end
	startTimer(newPit)
	if isInArray(ITEM_FIREFIELD_TIMER, getTopItem(PITS[oldPit].fromPos).itemid) then
		doRemoveItem(getTopItem(PITS[oldPit].fromPos).uid)
	end
	if (item.actionid == 25300) then
		setPlayerStorageValue(cid, STORAGE_PIT, 0)
		doSetMonsterOutfit(cid, "Chicken", 120 * 1000)
		doTeleportThing(cid, POSITION_KICK)
		doCreatureSay(cid, "Coward!", TALKTYPE_ORANGE_1)
		stopEvent(e2)
		stopEvent(e3)
		stopEvent(e4)
		stopEvent(e5)
		stopEvent(e6)
		stopEvent(e7)
		stopEvent(e8)
		stopEvent(e9)
		stopEvent(e10)
	end
	return true
end