local config = {
	[2080] = {text = 'You have touched Infernatil\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32909, 32211, 15)},
	[2081] = {text = 'You have touched Tafariel\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32761, 32243, 15)},
	[2082] = {text = 'You have touched Verminor\'s throne and absorbed some of his spirit.', effect = CONST_ME_POISONAREA, toPosition = Position(32840, 32327, 15)},
	[2083] = {text = 'You have touched Apocalypse\'s throne and absorbed some of his spirit.', effect = CONST_ME_EXPLOSIONAREA, toPosition = Position(32875, 32267, 15)},
	[2084] = {text = 'You have touched Bazir\'s throne and absorbed some of his spirit.', effect = CONST_ME_MAGIC_GREEN, toPosition = Position(32745, 32385, 15)},
	[2085] = {text = 'You have touched Ashfalor\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32839, 32310, 15)},
	[2086] = {text = 'You have touched Pumin\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32785, 32279, 15)}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local useThrone = config[item.uid]
	if not useThrone then
		return true
	end
	
	if player:getStorageValue(item.uid) ~= 1 then
		player:setStorageValue(item.uid, 1)
		player:getPosition():sendMagicEffect(useThrone.effect)
		player:say(useThrone.text, TALKTYPE_MONSTER_SAY)
	else
		player:teleportTo(useThrone.toPosition)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:say('Begone!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
