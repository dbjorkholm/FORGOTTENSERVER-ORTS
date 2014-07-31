local mounts = {
	{name = 'brown rented horse', price = 500, days = 1, mountId = 22, level = 10, premium = false, storage = 50561},
	{name = 'grey rented horse', price = 500, days = 1, mountId = 25, level = 20, premium = false, storage = 50562}
}

function onThink(interval)
	for _, player in ipairs(Game.getPlayers()) do
		local mount
		for i = 1, #monsters do
			mount = mounts[i]
			if player:hasMount(mount.mountId) and player:getStorageValue(mount.storage) > 0 and player:getStorageValue(mount.storage) <= os.time() then
				local outfit = player:getOutfit()
				outfit.lookMount = nil
				player:setOutfit(outfit)
				player:removeMount(mount.mountId)
				player:setStorageValue(mount.storage, -1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The time of your mount ' .. mount.name .. ' has ended, to get it again back to the NPC.')
			end
		end
	end

	return true
end
