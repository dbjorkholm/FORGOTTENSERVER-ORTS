function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then 
		return true
	end
	if item.uid == 3169 then
		if Tile(Position({x = 33265, y = 31116, z = 8})):getItemById(3687) then
			if Tile(Position({x = 33265, y = 31116, z = 7})):getItemById(3219) then
			Tile(Position({x = 33265, y = 31116, z = 7})):getItemById(3219):transform(9197)
			addEvent(function() Tile(Position({x = 33265, y = 31116, z = 7})):getItemById(9197):transform(3219) end, 5 * 30 * 1000)
			end
			player:say("The area around the gate is suspiciously quiet, you have a bad feeling about this.", TALKTYPE_MONSTER_SAY)
			if player:getStorageValue(Storage.ChildrenoftheRevolution.Mission05) == 1 then
				player:setStorageValue(Storage.ChildrenoftheRevolution.Mission05, 2) --Questlog, Children of the Revolution "Mission 5: Phantom Army"
			end
		end
	end
	return true
end
