local config = {
	[8009] = {Storage.ChildrenoftheRevolution.SpyBuilding01, "An impressive ammount of fish is stored here."},
	[8010] = {Storage.ChildrenoftheRevolution.SpyBuilding02, "A seemingly endless array of weapon stretches before you into the darkness."},
	[8011] = {Storage.ChildrenoftheRevolution.SpyBuilding03, "These barracks seem to be home for quite a lot of soldiers."}
}

function onStepIn(cid, item, position, fromPosition)
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
		player:setStorageValue(Storage.ChildrenoftheRevolution.Mission02, player:getStorageValue(Storage.ChildrenoftheRevolution.Mission02) + 1) --Questlog, Children of the Revolution "Mission 2: Imperial Zzecret Weaponzz"
	end
	return true
end
