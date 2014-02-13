local Area_fromPos, Area_toPos = {x = 33219, y = 31657, z = 13}, {x = 33222, y = 31661, z = 13}
local room = {
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
	local user = {}
	local p = Player(cid)
	local c = Creature(cid)
	local pos = Position(players_pos[i])
	local posn = Position(new_player_pos[i])
	local itenz = Item(item.uid)
	summon_demons = true
	failed = true
	if(item.itemid == 1946) then
		for i = 1,4 do
			user[i] = getThingfromPos(players_pos[i])
			if(user[i].itemid > 0) then
				if(isPlayer(user[i].uid)) then
					if(p:getLevel() >= 100) then
						if(not(isPlayerInArea(Area_fromPos, Area_toPos))) then
							table.insert(user, i)
							failed = false
						else
							return p:sendCancelMessage("A team is already inside the quest room.")
						end
					else
						return p:sendCancelMessage("All players must be above level 100.")
					end
				else
					return p:sendCancelMessage("You need 4 playerss.")
				end
			else
				return p:sendCancelMessage("You need 4 players.")
			end
		end
		if(failed) then
			 p:sendCancelMessage("Sorry, not possible.")
			return true
		end
		for i = 1, 4 do
			if(not(failed)) then
				p:teleportTo(new_player_pos[i], false)
				posn:sendMagicEffect(CONST_ME_POFF)
				pos:sendMagicEffect(CONST_ME_POFF)
				c:setDirection(EAST)
			end
		end
		if(summon_demons) then	
			for _x = room.fromX, room.toX do
				for _y = room.fromY, room.toY do
					for _z = room.fromZ, room.toZ do
						local t = Tile({x = _x, y = _y, z = _z})
						local creature = pushThing(t:getTopCreature())
						local cre = Creature(uid)
						if(isMonster(creature.uid)) then
							creature.uid:remove()
						end
					end
				end
			end
			for d = 1, 6 do
				doSummonCreature("Demon", demonPos[d])
			end
		end
		summon_demons = false
		itenz:transform(1945)
	elseif(item.itemid == 1945) then
		itenz:transform(1946)
	end
return true
end
