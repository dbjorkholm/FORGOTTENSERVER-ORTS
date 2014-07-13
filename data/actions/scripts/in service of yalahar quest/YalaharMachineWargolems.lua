local config = {
	[23700] = {23700, {x = 32882, y = 31323, z = 10}, {x = 32882, y = 31320, z = 10}, {x = 32882, y = 31318, z = 10}, {x = 32882, y = 31316, z = 10}},
	[23701] = {23701, {x = 32869, y = 31322, z = 10}, {x = 32869, y = 31320, z = 10}, {x = 32869, y = 31318, z = 10}, {x = 32869, y = 31316, z = 10}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local machines = config[item.actionid]
	if not machines then
		return true
	end
	if Game.getStorageValue(machines[1]) ~= 1 then 
		if player:getItemCount(9690) >= 4 then -- 4 gearwheel 
			Game.setStorageValue(machines[1], 1)
			addEvent(function() Game.setStorageValue(machines[1], -1) end, 60 * 60 * 1000) -- 1 hour until machine turn back
			player:removeItem(9690, 4)
			player:say("*CLICK*", TALKTYPE_MONSTER_YELL, false, cid, (machines[2]))
			player:say("*CLICK*", TALKTYPE_MONSTER_YELL, false, cid, (machines[3]))
			player:say("*CLICK*", TALKTYPE_MONSTER_YELL, false, cid, (machines[4]))
			player:say("*CLICK*", TALKTYPE_MONSTER_YELL, false, cid, (machines[5]))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You insert all 4 gear wheels, them adjusting the teleporter to transport you to the deeper floor")
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have enough gear wheels to activate the machine.")
		end
	end
	return true
end