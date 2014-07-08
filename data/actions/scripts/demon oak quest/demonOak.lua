local start_storage = 1013
local demon_stor = 1015

local floorDamage =
{
	min = 170,
	max = 210,
	type = COMBAT_EARTHDAMAGE,
	effect = CONST_ME_BIGPLANTS
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	if isInArray(demonOak, itemEx.itemid) then
 
		local get = getPlayerStorageValue(cid, itemEx.itemid)
		if get == -1 then setPlayerStorageValue(cid, itemEx.itemid, 1) end
		get = getPlayerStorageValue(cid, itemEx.itemid)
 
		local k = 0
		for i = demonOak[1], demonOak[#demonOak] do
			if(getPlayerStorageValue(cid, i) == (waves and waves > 0 and waves) + 1) then
				k = k + 1
			end
		end
 
		if killAllBeforeCut or k == #demonOak then
			if (isMonsterInArea(questAreaPosition[1], questAreaPosition[2], true, true)) then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need to kill all monsters first.")
				return true
			end
		end
 
		if(k == #demonOak) then 
			doTeleportThing(cid, positions.kick)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Tell Oldrak about your great victory against the demon oak.")
			setPlayerStorageValue(cid, storages.done, 1)
			setPlayerStorageValue(cid, start_storage, 3)
			return true
		end
 
		if getPlayerStorageValue(cid, itemEx.itemid) >= (waves and waves > 0 and waves) + 1 then
			return doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
 
		local deny = false
		local cbs = 0
		if summons_[itemEx.itemid] then
			if summons_[itemEx.itemid][get] then
				for _, s in ipairs(summons_[itemEx.itemid][get]) do
						for i = 1, s.count do
							local sPos = positions.summon[math.random(#positions.summon)]
							local thing = getTopCreature(sPos)
							local area
							if isMonster(thing.uid) then
								area = getCreaturesInRange(sPos, 2, 2)
								for _, pos in pairs(area) do
									if isCreature(getTopCreature(pos).uid) or not isInRange(pos, questAreaPosition[1], questAreaPosition[2]) then
										deny = true
										break
									else
										if (getPlayerStorageValue(cid, demon_stor) <= 37 and tonumber(doSummonCreature(s.monster, pos)) == nil) then
											cbs = cbs + 1
										end
										break
									end
								end
							else
								if (getPlayerStorageValue(cid, demon_stor) >= 38) then
									doSummonCreature("Demon", sPos)
									local demons = getCreaturesInRange(getPlayerPosition(cid), 7, 7, true,false,true)
									for i = 1, #demons do
										doRemoveCreature(demons[i])
									end
									doSummonCreature("Demon", sPos)
								elseif (getPlayerStorageValue(cid, demon_stor) <= 37 and tonumber(doSummonCreature(s.monster, sPos)) == nil) then
									cbs = cbs + 1
								end
							end
						end
					end
		 
					if cbs > 0 then
						return doPlayerSendCancel(cid, "There are " .. cbs .. " monster that could not be summoned. Wave has not been counted.")
					end
		 
					if not deny then
						setPlayerStorageValue(cid, itemEx.itemid, get + 1)
					end
					if isLastCut(cid) then
						doCreatureSay(cid, "HOW IS THAT POSSIBLE?!? MY MASTER WILL CRUSH YOU!! AHRRGGG!", TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or getCreaturePosition(cid)))
					else
						doCreatureSay(cid, sounds[2][math.random(#sounds[2])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or getCreaturePosition(cid)))
					end
					doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
				else
					local r = math.random(100)
					if (r >= 90) then
						local sPos = positions.summon[math.random(#positions.summon)]
						doSummonCreature("bonebeast", sPos)
						doSummonCreature("bonebeast", sPos)
						doSummonCreature("bonebeast", sPos)
						doSummonCreature("bonebeast", sPos)
					end
				end
			end
			setPlayerStorageValue(cid, itemEx.itemid, get + 1)
			doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPlayerStorageValue(cid, itemEx.itemid))
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			doCreatureSay(cid, "-krrrrak-", TALKTYPE_ORANGE_2, false, cid, getThingPos(itemEx.uid))
			if (getPlayerStorageValue(cid, demon_stor) < 1) then
				setPlayerStorageValue(cid, demon_stor, 1)
			else
				setPlayerStorageValue(cid, demon_stor, getPlayerStorageValue(cid, demon_stor) + 1)
			end
		end
	return true
end
