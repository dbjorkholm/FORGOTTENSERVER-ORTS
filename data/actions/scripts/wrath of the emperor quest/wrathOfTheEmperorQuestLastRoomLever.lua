function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3198) then
		for x = 33357, 33362 do
			for y = 31404, 31409 do
				pos = {x = x, y = y, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos).uid)) then
					doTeleportThing(getTopCreature(pos).uid, {x = 33364, y = 31413, z = 10})
					doSendMagicEffect({x = 33364, y = 31413, z = 10}, CONST_ME_TELEPORT)
				end
			end
		end
		if(not(getCreatureByName("snake god essence"))) then
			doSummonCreature("snake god essence", {x = 33359, y = 31406, z = 10})
		end
	end
	return true
end
