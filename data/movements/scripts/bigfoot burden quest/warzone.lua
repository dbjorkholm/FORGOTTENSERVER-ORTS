local bosses = {
	[3144] = {position = Position(33099, 31950, 10), name = 'deathstrike'},
	[3145] = {position = Position(33103, 31951, 11), name = 'gnomevil'},
	[3146] = {position = Position(33081, 31902, 12), name = 'abyssador'},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	player:teleportTo(boss.position)
	boss.position:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have half an hour to heroically defeat ' .. boss.name .. '. Otherwise you\'ll be teleported out by the gnomish emergency device.')
	return true
end
