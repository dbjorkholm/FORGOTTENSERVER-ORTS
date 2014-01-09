local mechanisms = {
	[3091] = {pos = {x = 32744, y = 31161, z = 5}, value = 21}, -- Alchemist
	[3092] = {pos = {x = 32744, y = 31164, z = 5}, value = 21},
	[3093] = {pos = {x = 32833, y = 31269, z = 5}, value = 24}, -- Trade
	[3094] = {pos = {x = 32833, y = 31266, z = 5}, value = 24},
	[3095] = {pos = {x = 32729, y = 31200, z = 5}, value = 29}, -- Arena
	[3096] = {pos = {x = 32734, y = 31200, z = 5}, value = 29},
	[3097] = {pos = {x = 32776, y = 31141, z = 5}, value = 35}, -- Cemetery
	[3098] = {pos = {x = 32776, y = 31145, z = 5}, value = 35},
	[3099] = {pos = {x = 32874, y = 31202, z = 5}, value = 41}, -- Sunken
	[3100] = {pos = {x = 32869, y = 31202, z = 5}, value = 41},
	[3101] = {pos = {x = 32856, y = 31251, z = 5}, value = 45}, -- Factory
	[3102] = {pos = {x = 32854, y = 31248, z = 5}, value = 45}
}

local mechanisms2 = {
	[9235] = {pos = {x = 32773, y = 31116, z = 7}},
	[9236] = {pos = {x = 32780, y = 31115, z = 7}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(mechanisms[item.uid]) then
		if(getPlayerStorageValue(cid, 30) >= mechanisms[item.uid].value) then
			doTeleportThing(cid, mechanisms[item.uid].pos)
			doSendMagicEffect(mechanisms[item.uid].pos, CONST_ME_TELEPORT)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You can't use this mechanism.")
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	elseif(mechanisms2[item.uid]) then
		doTeleportThing(cid, mechanisms2[item.uid].pos)
		doSendMagicEffect(mechanisms2[item.uid].pos, CONST_ME_TELEPORT)
	end
	return true
end