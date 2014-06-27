function onEquip(cid, item, slot)
	local player = Player(cid)
	local ring = player:getSlotItem(CONST_SLOT_RING)
	if ring:getId() ~= item.itemid then
		return true
	end

	local tile = player:getPosition():getTile()
	if tile then
		local thing = tile:hasFlag(TILESTATE_PROTECTIONZONE)
		if thing then
			return true
		end
	end

	doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -200, -200, CONST_ME_DRAWBLOOD)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It tightens around your wrist as you take it on.')
	local blood = Game.createItem(2019, 2, player:getPosition())
	blood:decay()
	return true
end
