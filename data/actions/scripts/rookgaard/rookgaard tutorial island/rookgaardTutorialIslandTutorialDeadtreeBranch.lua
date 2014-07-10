local playerexhaust = Condition(CONDITION_EXHAUST)
	playerexhaust:setParameter(CONDITION_PARAM_TICKS, 5000)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player= Player(cid)
	if player:getCondition(CONDITION_EXHAUST) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have to wait a few seconds until this tree can be used again.")
		return true
	end
	if player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) > 5 and player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) < 7 then
		player:addCondition(playerexhaust)
		player:sendTutorial(24)
		local branch = player:addItem(8582, 1)
		branch:decay()
		if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 15 then
			player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 15)
		end
	end
	return true
end