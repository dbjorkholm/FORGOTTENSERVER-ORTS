function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2216) then
                if(Player(cid):getStorageValue(2215) < 1) then
                        if(item.itemid == 5114) then
								Creature(uid):teleportTo(toPosition, true)
                                Item(uid):transform()
                        end
                end
        end
        return true
end

local Area_fromPos, Area_toPos = {x = 33219, y = 31657, z = 13}, {x = 33222, y = 31661, z = 13}
local room = { -- room with demons
	fromX = 33219,
	fromY = 31657,
	fromZ = 13,
	toX = 33224,
	toY = 31661,
	toZ = 13
}
local players_pos =  {
	{x = 33225, y = 31671, z = 13, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33224, y = 31671, z = 13, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33223, y = 31671, z = 13, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33222, y = 31671, z = 13, stackpos = STACKPOS_TOP_CREATURE}
}
local new_player_pos = {
	{x = 33222, y = 31659, z = 13},
	{x = 33221, y = 31659, z = 13},
	{x = 33220, y = 31659, z = 13},
	{x = 33219, y = 31659, z = 13}
}
local demonPos = {
	{x = 33219, y = 31657, z = 13},
	{x = 33221, y = 31657, z = 13},
	{x = 33223, y = 31659, z = 13},
	{x = 33224, y = 31659, z = 13},
	{x = 33220, y = 31661, z = 13},
	{x = 33222, y = 31661, z = 13}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local player = {}
        summon_demons = true
        failed = true
        if(item.itemid == 1946) then
                for i = 1,4 do
                        player[i] = getThingfromPos(players_pos[i])
                        if(player[i].itemid > 0) then
                                if(isPlayer(player[i].uid)) then
                                        if(Player:getLevel(player[i].uid) >= 100) then
                                                if (not isPlayerInArea(Area_fromPos, Area_toPos)) then
                                                        table.insert(player, i)
                                                        failed = false
                                                else
                                                        return (Player(cid):sendCancelMessage("A team is already inside the quest room."))
                                                end
                                        else
                                                return (Player(cid):sendCancelMessage("All players must be above level 100."))
                                        end
                                else
                                        return (Player(cid):sendCancelMessage("You need 4 players."))
                                end
                        else
                                return (Player(cid):sendCancelMessage("You need 4 players."))
                        end
                end
                if(failed == true) then
                        Player(cid):sendCancelMessage("Sorry, not possible.")
                return true
                end
                for i = 1, 4 do
                        if(failed == false) then
								Creature(uid):teleportTo(player[i].uid, new_player_pos[i], false)
								Position(new_player_pos[i]):sendMagicEffect(CONST_ME_TELEPORT)
								Position(players_pos[i]):sendMagicEffect(CONST_ME_POFF)
								Creature(player[i]):setDirection(EAST)
                        end
                end
                if(summon_demons) then        
                        for _x = room.fromX, room.toX do
                                for _y = room.fromY, room.toY do
                                        for _z = room.fromZ, room.toZ do
                                                local creature = getTopCreature({x = _x, y = _y, z = _z})
                                                if (isMonster(creature.uid)) then
                                                        Creature():remove(creature.uid)
                                                end
                                        end
                                end
                        end
                        for d = 1, 6 do
                                doSummonCreature("Demon", demonPos[d])
                        end
                end
                summon_demons = false
				Item(uid):transform(1945)
        elseif(item.itemid == 1945) then
				Item(uid):transform(1946)
        end
return true
end
