local nodes = {
	[8034] = {x = 32657, y = 31903, z = 8}, -- Depo
	[8035] = {x = 32606, y = 31905, z = 9}, -- Shops
	[8036] = {x = 32628, y = 31922, z = 11}, -- Temple
	[8037] = {x = 32576, y = 31973, z = 9}, -- Main Gate
	[8038] = {x = 32676, y = 31976, z = 15}, -- Steam Ship
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 1131) > os.time()) then
		if(getPlayerStorageValue(cid, 1132) < 100) then
			setPlayerStorageValue(cid, 1132, math.max(0, getPlayerStorageValue(cid, 1132)) + 1)
		end
		doTeleportThing(cid, nodes[item.actionid])
		doSendMagicEffect(nodes[item.actionid], CONST_ME_TELEPORT)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "To travel by ore wagons you must purchase a wagon ticket from any kazordoon's merchant.")
	end
	return true
end