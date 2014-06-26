function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 8012 then
		local player = Player(cid)
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 10 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 11)
			player:setStorageValue(Storage.ChildrenoftheRevolution.Mission03, 2) --Questlog, Children of the Revolution "Mission 3: Zee Killing Fieldzz"
			Item(item.uid):remove()
			player:say("The rice has been poisoned. This will weaken the Emperor's army significantly. Return and tell Zalamon about your success.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end