local config = {
	[11258] = {blessId = 4, text = 'The Spark of the Phoenix'},
	[11259] = {blessId = 2, text = 'The Embrace of Tibia'},
	[11260] = {blessId = 1, text = 'The Spiritual Shielding'},
	[11261] = {blessId = 3, text = 'The Fire of the Suns'},
	[11262] = {blessId = 5, text = 'The Wisdom of Solitude'}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if player:hasBlessing(useItem.blessId) then
		player:say('You already possess this blessing.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:addBlessing(useItem.blessId)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, useItem.text .. ' protects you.')
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	Item(item.uid):remove(1)
	return true
end