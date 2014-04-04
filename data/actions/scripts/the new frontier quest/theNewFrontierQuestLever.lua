local levers = {
	[8001] = {
		{x = 32993, y = 31547, z = 4},
		{x = 33061, y = 31527, z = 10},
	},
	[8006] = {
		{x = 33055, y = 31527, z = 10},
		{x = 0, y = 0, z = 0}, -- Need Review
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerPosition(cid).z == levers[item.actionid][1].z and 
		getPlayerPosition(cid).y == levers[item.actionid][1].y and 
		getPlayerPosition(cid).x == levers[item.actionid][1].x
	) then
		doTeleportThing(cid, levers[item.actionid][2])
		doSendMagicEffect(levers[item.actionid][2], CONST_ME_TELEPORT)
	elseif(getPlayerPosition(cid).z == levers[item.actionid][2].z and 
		getPlayerPosition(cid).y == levers[item.actionid][2].y and 
		getPlayerPosition(cid).x == levers[item.actionid][2].x
	) then
		doTeleportThing(cid, levers[item.actionid][1])
		doSendMagicEffect(levers[item.actionid][1], CONST_ME_TELEPORT)
	end
	return true
end