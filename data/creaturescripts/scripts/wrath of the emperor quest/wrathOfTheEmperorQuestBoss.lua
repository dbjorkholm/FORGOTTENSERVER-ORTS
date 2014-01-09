local boss = {
	["fury of the emperor"] = {pos = {x = 33049, y = 31089, z = 15}, storage = 3189},
	["wrath of the emperor"] = {pos = {x = 33095, y = 31090, z = 15}, storage = 3190},
	["scorn of the emperor"] = {pos = {x = 33095, y = 31114, z = 15}, storage = 3191},
	["spite of the emperor"] = {pos = {x = 33049, y = 31115, z = 15}, storage = 3192},
}

function onKill(cid, target)
	bossTmp = boss[string.lower(getCreatureName(target))]
	if(bossTmp) then	
		setGlobalStorageValue(bossTmp.storage, 0)
		doTransformItem(getTileItemById(bossTmp.pos, 11753).uid, 12383)
	end
	return true
end