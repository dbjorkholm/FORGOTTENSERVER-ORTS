function onEquip(cid, item, slot)
	local player = Player(cid)

	local tile = player:getPosition():getTile()
	if tile then
		local thing = tile:hasFlag(TILESTATE_PROTECTIONZONE)
		if thing then
			Item(item.uid):transform(10309)
			return true
		end
	end

	Item(item.uid):transform(10309)
	doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -200, -200, CONST_ME_DRAWBLOOD)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It tightens around your wrist as you take it on.')
	local blood = Game.createItem(2019, 2, player:getPosition())
	blood:decay()
	return true
end
