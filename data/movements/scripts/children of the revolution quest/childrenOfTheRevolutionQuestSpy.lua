local config = {
	[8009] = {1055, "An impressive ammount of fish is stored here."},
	[8010] = {1056, "A seemingly endless array of weapon stretches before you into the darkness."},
	[8011] = {1057, "These barracks seem to be home for quite a lot of soldiers."}
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	local targetTile = config[item.actionid]
	if not player then 
		return true
	end

	if not targetTile then
		return true
	end
	
	if player:getStorageValue(targetTile[1]) < 1 then
		player:setStorageValue(targetTile[1], 1)
		player:say(string.format("%s", targetTile[2]), TALKTYPE_ORANGE_1)
	end
	return true
end
