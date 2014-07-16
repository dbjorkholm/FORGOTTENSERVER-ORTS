local thrones = {
	[2080] = {text = "You have touched Infernatil's throne and absorbed some of his spirit.", animation = CONST_ME_FIREAREA},
	[2081] = {text = "You have touched Tafariel's throne and absorbed some of his spirit.'", animation = CONST_ME_MORTAREA},
	[2082] = {text = "You have touched Verminor's throne and absorbed some of his spirit.", animation = CONST_ME_POISONAREA},
	[2083] = {text = "You have touched Apocalypse's throne and absorbed some of his spirit.", animation = CONST_ME_EXPLOSIONAREA},
	[2084] = {text = "You have touched Bazir's throne and absorbed some of his spirit.", animation = CONST_ME_MAGIC_GREEN},
	[2085] = {text = "You have touched Ashfalor's throne and absorbed some of his spirit.", animation = CONST_ME_FIREAREA},
	[2086] = {text = "You have touched Pumin's throne and absorbed some of his spirit.", animation = CONST_ME_MORTAREA}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if not player:getStorageValue(item.uid) then
		player:setStorageValue(item.uid, 1)
		player:getPosition():sendMagicEffect(thrones[item.uid].animation)
		player:say(thrones[item.uid].text, TALKTYPE_MONSTER_SAY)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've already absorbed energy from this throne.")
	end
	return true
end
