function onStepIn(cid, item, pos)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local summonpos = {x = 33011, y = 32437, z = 11}
	if item.actionid == 4536 and (player:getStorageValue(9932) == 1) and (player:getStorageValue(9933) < 1) then
		player:setStorageValue(9933,1)
		doSummonCreature("Necromancer Servant", summonpos)
	end
end