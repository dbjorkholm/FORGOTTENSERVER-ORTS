function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 8009) then
		if(getPlayerStorageValue(cid, 1055) < 1) then
			setPlayerStorageValue(cid, 1055, 1)
			doCreatureSay(cid, "An impressive ammount of fish is stored here.", TALKTYPE_ORANGE_1)
		end
	elseif(item.actionid == 8010) then
		if(getPlayerStorageValue(cid, 1056) < 1) then
			setPlayerStorageValue(cid, 1056, 1)
			doCreatureSay(cid, "A seemingly endless array of weapon stretches before you into the darkness.", TALKTYPE_ORANGE_1)
		end
	elseif(item.actionid == 8011) then
		if(getPlayerStorageValue(cid, 1057) < 1) then
			setPlayerStorageValue(cid, 1057, 1)
			doCreatureSay(cid, "These barracks seem to be home for quite a lot of soldiers.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
