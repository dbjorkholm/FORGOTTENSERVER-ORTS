local config = {
	[23700] = {
		storage = 23700,
		machines = {
			{x = 32882, y = 31323, z = 10},
			{x = 32882, y = 31320, z = 10},
			{x = 32882, y = 31318, z = 10},
			{x = 32882, y = 31316, z = 10}
		}
	},
	[23701] = {
		storage = 23701,
		machines = {
			{x = 32869, y = 31322, z = 10},
			{x = 32869, y = 31320, z = 10},
			{x = 32869, y = 31318, z = 10},
			{x = 32869, y = 31316, z = 10}
		}
	}
}

local function disableMachine(storage)
	Game.setStorageValue(storage, -1)
end

function onUse(cid, item, position, itemEx, toPosition)
	local machineGroup = config[item.actionid]
	if not machineGroup then
		return true
	end

	if Game.getStorageValue(machineGroup.storage) == 1 then
		return true
	end

	local player = Player(cid)
	if player:getItemCount(9690) < 4 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough gear wheels to activate the machine.')
		return true
	end

	Game.setStorageValue(machineGroup.storage, 1)
	addEvent(disableMachine, 60 * 60 * 1000, machineGroup.storage)
	player:removeItem(9690, 4)
	for i = 1, #machineGroup.machines do
		player:say('*CLICK*', TALKTYPE_MONSTER_YELL, false, cid, machineGroup.machines[i])
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You insert all 4 gear wheels, them adjusting the teleporter to transport you to the deeper floor')
	return true
end