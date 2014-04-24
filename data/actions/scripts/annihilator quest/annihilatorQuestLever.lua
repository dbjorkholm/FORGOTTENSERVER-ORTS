local players_area =  {
	{x = 33225, y = 31671, z = 13},
	{x = 33222, y = 31671, z = 13}
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

function getPlayerCountInArea(toPos, fromPos)

	local count = 0
	local cid = {}

	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = toPos.z, toPos.z do
				local creature = getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid
				if(creature > 0) then
					if(isPlayer(creature)) then
						table.insert(cid, creature)
						count = count + 1
						if(getPlayerLevel(creature) < 100) then
							return "All players must be above level 100."
						end
					elseif(isMonster(creature)) then
						return "Players are allowed only."
					end
				end
			end
		end
	end

	if(count < 4) then
		return "You need 4 players."
	else
		for i = 1,4 do
			Player(cid[5-i]):teleportTo(new_player_pos[i])
			Player(cid[5-i]):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

function SummonDemon(Pos)
local count = 0
local cid = {}
	for x = Pos[1].x, Pos[4].x do
		for y = Pos[1].y, Pos[6].y do
			for z = Pos[1].z, Pos[6].z do
				local creature = getTopCreature({x = x, y = y, z = z, stackpos = 255}).uid
				if(creature > 0) then
					if(isPlayer(creature)) then
						return "A team is already inside the quest room."
					elseif(isMonster(creature)) then
						table.insert(cid, creature)
						count = count + 1
					end
				end
			end
		end
	end
	
	for i = 1, #cid do
		doRemoveCreature(cid[i])
	end

	for i = 1, #Pos do
		doSummonCreature("Demon", Pos[i])
	end
	
	return getPlayerCountInArea(players_area[1], players_area[2])
end

function onUse(cid, item)
	if(item.itemid == 1946) then
		local condition = SummonDemon(demonPos)
		if(condition ~= true) then
			doPlayerSendCancel(cid, condition)
		end
	else
		Item(item.uid):transform(1946)
	end
	return true
end