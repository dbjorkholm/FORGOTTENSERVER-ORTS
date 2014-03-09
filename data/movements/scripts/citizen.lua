local t = {
	[9056] = {id = 4},
	[9057] = {id = 2},
	[9058] = {id = 1},
	[9059] = {id = 5},
	[9060] = {id = 3},
	[9061] = {id = 10},
	[9062] = {id = 9},
	[9063] = {id = 11},
	[9064] = {id = 7},
	[9065] = {id = 8},
	[9066] = {id = 12},
	[9067] = {id = 13},
	[9068] = {id = 14},
	[9240] = {id = 28},
	[9500] = {id = 29}
}
function onStepIn(cid, item, position, fromPosition)
	local town = t[item.uid]
	if Player(cid) then
		if town then
			Player(cid):setTown(Town(town.id))
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are now a citizen of "..getTownName(getPlayerTown(cid))..".")	
		end
	end
	return true
end