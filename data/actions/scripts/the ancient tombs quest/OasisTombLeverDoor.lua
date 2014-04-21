function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		if(math.random(1, 3) == 1) then
		local carrotpos = {x = toPosition.x - 1, y = toPosition.y, z = toPosition.z}
		Position(carrotpos):sendMagicEffect(CONST_ME_TELEPORT)
		Game.createItem(2684, 1, Position(carrotpos))
		Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You found the carrot! The door is open!")
		Item(item.uid):transform(1946)
		addEvent(function(toPosition) local tile = toPosition:getTile() if tile then local thing = tile:getItemById(1946) if thing and thing:isItem() then thing:transform(1945) end end end, 4 * 1000, toPosition)
		addEvent(function(toPosition) local carrotpos = {x = toPosition.x - 1, y = toPosition.y, z = toPosition.z} local tile = Position(carrotpos):getTile() if tile then local thing = tile:getItemById(2684) if thing and thing:isItem() then thing:remove(1) end end end, 4 * 1000, toPosition)
		local doorpos = {x = 33122, y = 32765, z = 14}
		local tile = Position(doorpos):getTile()
		if tile then 
			local thing = tile:getItemById(1243) 
			if thing and thing:isItem() then
			thing:transform(1244)
			end 
		end
		else
		Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "you guess wrong! Take this! Carrot changed now the Hat!")
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, Player(cid):getPosition(), 0, -200, -200, CONST_ME_POFF)
		end
	elseif item.itemid == 1243 then
	Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You first must find the Carrot under one of the three hats to get the access!")
	end
	return true
end

