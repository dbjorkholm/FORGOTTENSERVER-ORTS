function onStepIn(cid, item, pos)
	if item.actionid == 4536 and (getPlayerStorageValue(cid,9932) == 1) and (getPlayerStorageValue(cid,9933) < 1) then
		setPlayerStorageValue(cid,9933,1)
		doSummonCreature("Necromancer Servant", {x = 33011, y = 32437, z = 11})
	end
end