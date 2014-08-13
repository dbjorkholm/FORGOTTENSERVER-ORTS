local mounts = {22, 25, 26}

function onThink(interval)
	for _, player in ipairs(Game.getPlayers()) do
		local mountId
		for i = 1, #mounts do
			mountId = mounts[i]
			if player:hasMount(mountId) and player:getStorageValue(50561) > 0 and player:getStorageValue(50561) <= os.time() then
				local outfit = player:getOutfit()
				outfit.lookMount = nil
				player:setOutfit(outfit)
				player:removeMount(mountId)
				player:setStorageValue(50561, -1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your contract with your horse expired and it returned back to the horse station.')
			end
		end
	end
	return true
end
