local boss = {
	[3144] = {pos = {x = 33099, y = 31950, z = 10}, name = "deathstrike"},
	[3145] = {pos = {x = 33103, y = 31951, z = 11}, name = "gnomevil"},
	[3146] = {pos = {x = 33081, y = 31902, z = 12}, name = "abyssador"},
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)

	if player:isPlayer() then
		player:TeleportTo(boss[item.uid].pos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have half an hour to heroically defeat " .. boss[item.uid].name .. ". Otherwise you'll be teleported out by the gnomish emergency device.")
	end
	return true
end
