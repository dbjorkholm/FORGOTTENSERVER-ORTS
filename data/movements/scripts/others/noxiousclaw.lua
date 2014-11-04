function onEquip(player, item, slot)
	Item(item.uid):transform(10309)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		return true
	end

	doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -200, -200, CONST_ME_DRAWBLOOD)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It tightens around your wrist as you take it on.')
	return true
end

