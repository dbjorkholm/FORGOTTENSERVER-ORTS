function onKill(cid, target)
	local monsterTarget = Monster(target)
	if monsterTarget:getName() == "Cockroach" then
		local player = Player(cid)
		if player:getStorageValue(Storage.RookgaardTutorialIsland.cockroachKillStorage) < 1 then
			player:sendTutorial(8)
			player:setStorageValue(Storage.RookgaardTutorialIsland.cockroachKillStorage, 1)
		elseif player:getStorageValue(Storage.RookgaardTutorialIsland.cockroachKillStorage) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can also automatically chase after selected creatures by clicking the 'chase opponent' button in the Combat Controls menu.")
			player:setStorageValue(Storage.RookgaardTutorialIsland.cockroachKillStorage, 2)
			player:sendTutorial(18)
			player:sendTutorial(38)
		end	
	end
	return true
end
