local config = {
	[8009] = {storageKey = Storage.ChildrenoftheRevolution.SpyBuilding01, text = "An impressive ammount of fish is stored here."},
	[8010] = {storageKey = Storage.ChildrenoftheRevolution.SpyBuilding02, text = "A seemingly endless array of weapon stretches before you into the darkness."},
	[8011] = {storageKey = Storage.ChildrenoftheRevolution.SpyBuilding03, text = "These barracks seem to be home for quite a lot of soldiers."}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then 
		return true
	end

	local targetTile = config[item.actionid]
	if not targetTile then
		return true
	end
	
	if player:getStorageValue(targetTile.storageKey) < 1 then
		player:setStorageValue(targetTile.storageKey, 1)
		player:say(targetTile.text, TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.ChildrenoftheRevolution.Mission02, player:getStorageValue(Storage.ChildrenoftheRevolution.Mission02) + 1) --Questlog, Children of the Revolution "Mission 2: Imperial Zzecret Weaponzz"
	end
	return true
end
