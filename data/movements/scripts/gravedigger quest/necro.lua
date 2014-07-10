function onStepIn(cid, item, position)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if player:getStorageValue(9932) == 1 and player:getStorageValue(9933) < 1 then
		player:setStorageValue(9933,1)
		Game.createMonster("Necromancer Servant", Position(33011, 32437, 11))
	end
end
