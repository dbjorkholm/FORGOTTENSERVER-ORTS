local globalStorages = {9710, 9711, 9712, 9713, 9714, 9716}

function onStartup(interval)
	Game.setStorageValue(globalStorages[math.random(#globalStorages)], 1)
end
